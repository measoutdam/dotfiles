" Lightline
let g:lightline = {
\  'colorscheme': 'solarized',
\  'active': {
\    'left': [['mode', 'paste'],['gitbranch'], ['filename']],
\    'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\  },
\  'component_function': {
\    'gitbranch': 'fugitive#head',
\    'filename': 'LightlineFileName',
\  },
\ }


function! LightlineFileName()
  let filename = expand('%') !=# '' ? expand('%') : '[No Name]'
  let modified = &modified ? " " : ''
  return filename . modified
endfunction
