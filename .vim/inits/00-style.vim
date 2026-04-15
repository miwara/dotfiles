" --- 00-style.vim (Appearance Settings) ---
syntax enable

" Theme
" https://github.com/nordtheme/vim
if (has("termguicolors"))
  set termguicolors
endif

silent! colorscheme nord

" --- Tips: テーマの切り替え方法 ---
" 1. 一時的に試す: ノーマルモードで `:colorscheme <Tab>` を入力して選択
" 2. 恒久的に変更: 上記の `colorscheme <THEME>` の `<THEME>` をテーマ名に書き換える
"    (新しいテーマを使う場合は `vimrc` に `Plug '<作者>/<リポジトリ>'` を追加して `:PlugInstall`)
" ---------------------------------

set number
set showmatch
