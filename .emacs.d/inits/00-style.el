;; Emacs common style


;; 画面設定 (Theme)
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-nord t)
  ;; --- Tips: テーマの切り替え方法 ---
  ;; 1. 一時的に試す: `M-x load-theme` を実行して候補を選択
  ;; 2. 恒久的に変更: 上記の `(load-theme '<THEME> t)` の `<THEME>` をテーマ名に書き換える
  ;;    (doom-themes パックには `doom-one`, `doom-nord`, `doom-vibrant` など多数含まれています)
  ;; ---------------------------------
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; フレームの透明度
(set-frame-parameter nil 'alpha-background 85)

;; region と hl-line の設定 (色はテーマに任せる)
(setq transient-mark-mode t)
(global-hl-line-mode 1)

;; 行番号・桁番号の表示
(line-number-mode 1)
(column-number-mode 1)

;; ツールバー，スクロールバーの非表示
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
)

;; メニューバーの非表示
(menu-bar-mode 0)

;; 対応する括弧を強調表示
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; 行末の空白を強調表示
(use-package whitespace
  :ensure nil
  :diminish
  :custom
  (whitespace-style '(face trailing tabs empty space-mark))
  ;; 全角スペースは□ (U+25A1)で表示する
  (whitespace-display-mappings '((space-mark ?\u3000 [?\u25a1])))
  ;; 可視化は全角スペースのみ
  (whitespace-space-regexp "\\(\u3000+\\)")
  :init
  (global-whitespace-mode 1))

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

