" --- 20-coc.vim (LSP: coc.nvim) ---

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" 定義元に戻る
nmap <silent> gb <C-o>

" ホバーでドキュメント表示
nmap <silent> K :call CocActionAsync('doHover')<CR>

" 参照一覧
nmap <silent> gr <Plug>(coc-references)
