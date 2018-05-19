cnoreabbrev Ag Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " As ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
