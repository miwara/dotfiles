set number
set showmatch
set tags=./tags, tags

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
nnoremap <C-k> :split<CR> :exe("tjump ".expand('cword>'))<CR>
