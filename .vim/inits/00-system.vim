" --- 00-system.vim (System & Keymap Settings) ---

" .vimrc 保存時に自動で再読み込み
augroup vimrc_reload
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
augroup END

" 外部で変更があった場合に自動で再読み込みする
set autoread
augroup checktime
  autocmd!
  autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
augroup END

set tags=./tags,tags

" --- Key Bindings ---
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
