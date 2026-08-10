" --- 20-ale.vim (Format on Save: ale) ---

let g:ale_fix_on_save = 1

let g:ale_fixers = {
  \ 'typescript':  ['prettier'],
  \ 'typescriptreact': ['prettier'],
  \ 'javascript':  ['prettier'],
  \ 'javascriptreact': ['prettier'],
  \ 'rust':        ['rustfmt'],
  \ 'go':          ['gofmt'],
  \ 'python':      ['ruff'],
  \ 'c':           ['clang-format'],
  \ 'cpp':         ['clang-format'],
  \ }
