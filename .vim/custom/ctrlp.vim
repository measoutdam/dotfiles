""Set color for ctrlp prompt
highlight CtrlPPrtCursor ctermfg=bg ctermbg=50

" let g:ctrlp_map = '<leader>,'
let g:ctrlp_prompt_mappings = { 'PrtInsert("c")':       ['<c-p>']}
let g:ctrlp_match_window = 'max:20'         "max items in matched list
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_clear_cache_on_exit = 0
nmap <leader><leader> :CtrlPBuffer<cr>
" hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" let g:ctrlp_custom_ignore ='node_modules\|ds_store\|.git\|tmp\|.bundle\|vendor\ruby\'
