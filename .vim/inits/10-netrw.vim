" --- 10-netrw.vim (File Tree: NERDTree) ---

let g:NERDTreeWinSize = 25    " ウィンドウ幅 25%
let g:NERDTreeShowHidden = 1  " 隠しファイルを表示

nnoremap <Leader>e :NERDTreeToggle<CR>

" 起動時に自動でファイルツリーを開く
autocmd VimEnter * NERDTree | wincmd p

" NERDTree だけ残ったら Vim を終了する
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
