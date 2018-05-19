" *              Search helper                *
" The Silver Searcher - using ag when available
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --vimgrep

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " As ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Bind :Ag to :grep! with arg required
command! -nargs=+ -complete=file Ag silent! grep! <args>|cwindow|redraw!

" Bind a to grep word under cursor
nnoremap <leader>f :Ag "\b<C-R><C-W>\b"<CR>

" Bind a to greg selected word - visual mode
vmap <leader>f y:Ag '<C-R>"'<CR>

" About to execuent Ag with current word as an argument
nnoremap <leader>F :Ag<Space>'<C-R><C-W>'

" About to execuent Ag with current visual selected word as an argument
vmap <leader>F y:Ag '<C-R>"'

" About to execute FindReplace in normal mode
nnoremap <leader>/ :call FindReplace('<C-R><C-W>','')<left><left>

" About to execute FindReplace in visual mode
vmap <leader>/ y:call FindReplace('<C-R>"','')<left><left>

function! FindReplace(pattern,replace,...)
  let pattern = a:pattern
  let replace = a:replace
  let scope = a:0 >= 1 ? " -G ".a:1 : ""
  execute "Ag '".pattern."'".scope
  execute "cdo %s/".pattern."/".replace."/gc | update"
endfunction

