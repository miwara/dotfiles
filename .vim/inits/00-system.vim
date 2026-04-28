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
