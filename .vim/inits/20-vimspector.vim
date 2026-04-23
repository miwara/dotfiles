" --- 20-vimspector.vim (Debugger: vimspector) ---

let g:vimspector_enable_mappings = 'HUMAN'

" デバッグアダプタのインストール
" :VimspectorInstall <adapter> で個別インストール可能
" 対応アダプタ: debugpy(Python), delve(Go), CodeLLDB(Rust/C/C++), js-debug(TypeScript)

nmap <F5>  <Plug>VimspectorContinue
nmap <F9>  <Plug>VimspectorToggleBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <F11> <Plug>VimspectorStepInto
nmap <F12> <Plug>VimspectorStepOut
