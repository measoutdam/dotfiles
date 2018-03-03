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
"End of Plugins functions 
call vundle#end()            " required
"=====================General config=================
" Syntax
syntax on

" map lead to ,
let mapleader=","

" Line Number
set number

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

" Quick saving
nnoremap <leader>w :w!<cr>

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
