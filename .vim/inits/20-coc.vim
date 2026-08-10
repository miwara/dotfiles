" --- 20-coc.vim (LSP: coc.nvim) ---

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ ]

" 補完候補の移動・確定
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" 手動補完
inoremap <silent><expr> <C-Space> coc#refresh()

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" 定義元に戻る
nmap <silent> gb <C-o>

" ホバーでドキュメント表示
nmap <silent> K :call CocActionAsync('doHover')<CR>

" 参照一覧
nmap <silent> gr <Plug>(coc-references)
