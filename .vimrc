"=====================Vundle config=================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"=====================Vundle - Vim Plugin========================

Plugin 'VundleVim/Vundle.vim'
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
"End of Plugins functions
call vundle#end()            " required
"=====================General config=================
" Syntax
syntax on

" map lead to ,
let mapleader=","

" Line Number
set number

" Make backspace works like most program
set backspace=indent,eol,start
" Map new line to Shift+enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Set to auto read when a file is changed from the outside
set autoread

" Map ; to :
nmap ; :

"No sounds
set visualbell

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>
" Some quick editing operations in normal mode
nnoremap ss i<space><esc>
nnoremap o o<Esc>
nnoremap O O<Esc>
nmap <leader>qq :qa<cr>
nmap <leader>ne :NERDTree<cr>
" Quick saving
nnoremap <leader>w :w!<cr>

" Current cursor shape
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" ================ Indentation ======================

filetype plugin indent on    " required
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" *********************************************
" *           Plugin Customization            *
" *********************************************

" ctrlp.vim
let g:ctrlp_match_window = 'max:15'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
" vim nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
