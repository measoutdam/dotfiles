set statusline=
set statusline+=%#Pmenu#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

function! StatuslineGit()
  let l:branchname = fugitive#head()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let g:currentmode={
      \ 'n'  : 'NORMAL ',
      \ 'no' : 'N·OPERATOR PENDING ',
      \ 'v'  : 'VISUAL ',
      \ 'V'  : 'V·LINE ',
      \ 'x22' : 'V·BLOCk ',
      \ 's'  : 'SELECT ',
      \ 'S'  : 'S·LINE ',
      \ 'x19' : 'S·BLOCk ',
      \ 'i'  : 'INSERT ',
      \ 'R'  : 'REPLACE ',
      \ 'Rv' : 'V·REPLAce ',
      \ 'c'  : 'COMMAND ',
      \ 'cv' : 'VIM EX ',
      \ 'ce' : 'EX ',
      \ 'r'  : 'PROMPT ',
      \ 'rm' : 'MORE ',
      \ 'r?' : 'CONFIRM ',
      \ '!'  : 'SHELL ',
      \ 't'  : 'TERMINAl '
      \}
