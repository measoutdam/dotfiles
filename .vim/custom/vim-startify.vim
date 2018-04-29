" *          Asynchronous Checkers            *
"
" hilight
highlight StartifyHeader  ctermfg=77
"Set custom ascii for staify
let g:ascii = [
\'                            _',
\'                   __   __ (_)  _ __ __',
\'                   \ \ / / | | |  _ ` _ `',
\'                    \ V /  | | | | | | | |',
\'                     \_/   |_| |_| |_| |_|',]

"Align header - center
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
      \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:filter_header(startify#fortune#boxed() + g:ascii)

