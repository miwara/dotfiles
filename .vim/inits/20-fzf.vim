" --- 20-fzf.vim (Fuzzy Finder: fzf) ---

if !executable('fzf')
  echomsg '[Warning] fzf not found. Please install fzf.'
endif

" カラーテーマに合わせた fzf の配色
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Statement'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'header':  ['fg', 'Comment'] }

" :Rg をプレビューウィンドウ付きに上書き
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
function! s:RgFromMain()
  if exists('b:NERDTree')
    wincmd l
  endif
  execute 'Rg'
endfunction

nnoremap <C-g> :call <SID>RgFromMain()<CR>
