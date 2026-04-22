" --- 10-filetree.vim (File Tree: NERDTree) ---

let g:NERDTreeWinSize = 25    " ウィンドウ幅 25%
let g:NERDTreeShowHidden = 1  " 隠しファイルを表示

nnoremap <Leader>e :NERDTreeToggle<CR>

" 起動時に自動でファイルツリーを開く
" ディレクトリ引数があればそこを，なければカレントディレクトリを表示する
autocmd VimEnter * if argc() == 1 && isdirectory(argv(0))
  \ | execute 'cd' fnameescape(argv(0)) | enew | NERDTree | wincmd p
  \ | else
  \ | NERDTree | wincmd p
  \ | endif

" NERDTree だけ残ったら Vim を終了する
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
