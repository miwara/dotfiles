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

set mouse=a
set clipboard=unnamed

" ターミナルでのペースト時のレイアウト崩れ防止
if &term =~ "xterm"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif

set wildignorecase
set selection=exclusive
set re=0
set tags=./tags,tags

" --- Universal cursor movement ---
" Normal mode
nnoremap <C-l> zz

" Insert mode
"inoremap <C-b> <Left>
"inoremap <C-f> <Right>
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
"inoremap <C-a> <Home>
"inoremap <C-e> <End>
"inoremap <M-f> <C-Right>
"inoremap <M-b> <C-Left>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
ionremap <C-k> <C-o>D
inoremac <C-l> <C-o>zz

" Visual mode
"vnoremap <C-b> h
"vnoremap <C-f> l
"vnoremap <C-p> k
"vnoremap <C-n> j
"vnoremap <C-a> 0
"vnoremap <C-e> $
"vnoremap <M-f> w
"vnoremap <M-b> b
vnoremap <C-l> zz

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

"nnoremap <CR> :put! =''<CR>j
