" *********************************************
" *             Vundle - Plugin              *
" *********************************************
" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'weynhamz/vim-plugin-powerline'
Plugin 'ervandew/supertab' 
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'gabrielelana/vim-markdown'
Plugin 'wikitopian/hardmode'
Plugin 'rking/ag.vim'
call vundle#end()   " required

" *********      End of Plugins      ***********

" *********************************************
" *               General config              *
" *********************************************
syntax on
set number
set showcmd
set autoread
set visualbell
let mapleader=","
set hlsearch
set laststatus=2
" Make backspace works like most program
set backspace=indent,eol,start

" Indentation 
filetype plugin indent on    " required
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Current cursor shape
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

set t_Co=256             " Set terminal to 256 colors
set background=dark
colorscheme solarized
set nofoldenable                  "dont fold by default


" *********************************************
" *       Normal Mode - Action Remapped       *
" *********************************************
" General Key mapping
nnoremap ss i<space><esc>
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap cc cc<Esc>
nnoremap <leader>vl ^v$
nmap <leader>qq :qa<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>r :@:<cr>
nmap ; :

" Vim - Window Pane Resizing 
nnoremap <silent> <leader>[ :vertical resize +10<cr>
nnoremap <silent> <leader>] :vertical resize -10<cr>
nnoremap <silent> <leader>} :vertical resize 30<cr>

" *********************************************
" *           Plugin Customization            *
" *********************************************
" Vim Operator Flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" NERDTree
nmap <leader>ne :NERDTree<cr>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore = ['\.swp$', '.DS_Store$', '\.ebextensions', '\.git$', '\.bundle']
map \ :NERDTreeToggle<CR> " File tree browser - ackslash
map \| :NERDTreeFind<CR> " File tree browser showing current file - pipe (shift-backslash)

" ctrlp.vim 
let g:ctrlp_match_window = 'max:15'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|tmp\|.bundle\|vendor/ruby'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" IndenLine
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_color_term = 0
let g:indentLine_faster = 1
let g:indentLine_indentLevel = 8
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
map <leader>I :IndentLinesToggle<CR>

" Vim Hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"" AckGrep current word
map <leader>a :call AckGrep('')<CR>

" AckVisual current selection
vmap <leader>a :call AckVisual()<CR>
command! -nargs=? Ag call AckGrep(<q-args>)

" Custom for QuickFix
map <leader>co :copen<CR>
" AG.VIM
nnoremap <leader>f :Ag<Space>
let g:ag_working_path_mode="r"

" Ack current word in command mode
function! AckGrep(word)
  let word = empty(a:word) ? expand("<cword>") : a:word
  execute "Ag ".word
  cw
endfunction

function! AckVisual()
  normal gv"xy
  let escape_chars = ['(', ')']
  for char in escape_chars
    let @x = escape(@x, char)
  endfor
  execute "Ag ".shellescape(@x)
  cw
endfunction

