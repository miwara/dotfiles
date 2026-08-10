# conf-loader 仕様書

Emacs・Vim 共通の設定ファイル自動ロード機能．外部パッケージに依存せず標準機能のみで実装する．

---

## 概要

エントリポイント（`init.el` / `.vim/vimrc`）を最小限に保ちつつ，設定を機能単位のファイルに分割して管理する．ロード順序はファイル名のソート順で決定し，エラーが発生したファイルをスキップして処理を継続する．

---

## ファイル構成

```
# Emacs
~/.emacs.d/
  init.el          # エントリポイント（文字コード・package.el・conf-loader 定義のみ）
  inits/           # 設定ファイル格納ディレクトリ
    00-style.el
    00-system.el
    10-eshell.el
    20-yasnippet.el
    20-multiplecursors.el
    darwin.el      # macOS 固有（任意）
    gnu-linux.el   # Linux 固有（任意）
    windows-nt.el  # Windows 固有（任意）

# Vim
~/.vimrc           # エントリポイント（source ~/.vim/vimrc の1行のみ）
~/.vim/
  vimrc            # vim-plug + conf-loader 定義
  inits/           # 設定ファイル格納ディレクトリ
    00-style.vim
    00-system.vim
    darwin.vim     # macOS 固有（任意）
    linux.vim      # Linux 固有（任意）
    windows.vim    # Windows 固有（任意）
```

---

## ロードロジック

### 1. ファイルの選別

対象ディレクトリ内のファイルをファイル名のアルファベット順（数字順）にソートしてロードする．

**除外ルール（以下に該当するファイルはスキップ）:**

| 条件 | Emacs | Vim |
|------|-------|-----|
| `_` で始まる | ✓ | ✓ |
| `.` で始まる（隠しファイル） | ✓ | ✓ |
| `#` で始まる（Emacs 一時ファイル） | ✓ | — |
| `~` で終わる（バックアップファイル） | ✓ | — |
| 現在の OS 固有ファイル名と一致する（別途末尾でロード） | ✓ | ✓ |
| 既知の OS 名と一致するが現在の OS ではない | ✓ | ✓ |

`_` プレフィックスは「無効化」の用途に使う．ファイルを削除せず一時的にロードを止めたいときに使用する．

既知の OS 名は実装内で定義されており，該当するファイルは現在の OS と一致しない限りスキップされる（Emacs: `conf-loader-known-os-names`，Vim: `l:known_os_names`）．

### 2. OS 固有ファイルのロード

通常ファイルをすべてロードした後，OS 名と一致するファイルがあれば最後にロードする．OS 固有の設定で通常設定を上書きすることを意図している．

**OS 名の決定:**

| OS | Emacs (`system-type`) | Vim |
|----|----------------------|-----|
| macOS | `darwin` | `darwin` |
| Linux | `gnu-linux` ※ | `linux` |
| Windows | `windows-nt` | `windows` |

※ Emacs の `system-type` は `gnu/linux` を返すため，`/` を `-` に置換して `gnu-linux.el` として扱う．

### 3. エラー処理

1ファイルでエラーが発生しても処理を継続し，残りのファイルをロードする．エラーはメッセージに記録する．

- Emacs: `condition-case` でキャッチ → `*Messages*` バッファで確認（`C-h e`）
- Vim: `try...catch` でキャッチ → `:messages` で確認

---

## ドライランモード

実際のロードを行わず，ロード対象ファイルの順序をメッセージ出力するだけのデバッグ用モード．

### Emacs

```elisp
;; 起動時に設定して実行
emacs --eval '(setq conf-loader-dry-run t)' --load ~/.emacs.d/init.el
```

### Vim

```sh
# --cmd で変数をセットしてから vimrc をロードさせる
vim --cmd "let g:conf_loader_dry_run = 1"
```

`g:conf_loader_dry_run` は `!exists()` ガードで保護されているため，`--cmd` による外部設定が vimrc に上書きされない．

---

## メッセージ形式

```
--- Starting conf-loader: /path/to/inits/ ---
[Dry-run] Would load: 00-style.el      # ドライランのみ
[Error] Failed to load foo.el: ...     # エラー時のみ
--- Finished conf-loader: /path/to/inits/ ---
```

通常ロード時（非ドライラン）はメッセージを出力しない．
