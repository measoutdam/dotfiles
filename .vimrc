" *********************************************
" *             Vundle - Plugins              *
" *********************************************
" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
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
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'gabrielelana/vim-markdown'
Plugin 'mileszs/ack.vim'

call vundle#end()            " required

" *********      End of Plugins      ***********

" *********************************************
" *               General config              *
" *********************************************
syntax on
set number
set autoread
set visualbell
let mapleader=","

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
set foldmethod=syntax             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default
set cursorline

" *********************************************
" *       Normal Mode - Action Remapped       *
" *********************************************
nnoremap ss i<space><esc>
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap cc cc<Esc>
nnoremap cc cc<Esc>
nnoremap <leader>vl ^v$
nmap <leader>qq :qa<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>r :@:<cr>
nmap <leader>ne :NERDTree<cr>
nmap ; :
" Map new line to Shift+enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Vim - Window Pane Resizing 
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>


" *********************************************
" *           Plugin Customization            *
" *********************************************
" Vim Operator Flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" NERDTree
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
