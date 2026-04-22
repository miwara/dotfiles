" --- 20-fzf.vim (Fuzzy Finder: fzf) ---

if !executable('fzf')
  echomsg '[Warning] fzf not found. Please install fzf.'
endif

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
