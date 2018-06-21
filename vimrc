set nocompatible
filetype off " *********************************************
" *              Vundle Plugins               *
" *********************************************
call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'KeitaNakamura/neodark.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-textobj-quotes'      "object q, iq
Plug 'christoomey/vim-sort-motion'        "gs{motions}
Plug 'christoomey/vim-system-copy'        "cp{motion}, cP, cv
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'haya14busa/vim-operator-flashy'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-indent'            "object i, vai, vii
Plug 'kana/vim-textobj-line'              "object l, il, al
Plug 'kana/vim-textobj-user'              "requires bt vim-textobj-quotes
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'     "object ar, ir
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'qpkorr/vim-bufkill'
Plug 'rizzatti/dash.vim'
Plug 'romainl/vim-qf'
Plug 'roxma/nvim-completion-manager'        " pip3 install --upgrade neovim
Plug 'roxma/vim-hug-neovim-rpc'                   " required by nvim-completion-manager
Plug 'scrooloose/nerdtree'
Plug 'simeji/winresizer'                  " To enter resizing mode : ctrl+e, and exit by enter
Plug 'skywind3000/asyncrun.vim'
Plug 'stephpy/vim-yaml'
Plug 'tmhedberg/SimpylFold'
Plug 'tonekk/vim-binding-pry'
Plug 'tpope/vim-commentary'               "gc{motion}, v_gc, {number}gcc
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'                 "cs, ds, ys + {motion}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'wfleming/vim-codeclimate'
Plug 'jlanzarotta/bufexplorer'

call plug#end()
" *********************************************
" *               General config              *
" *********************************************
"Basic
syntax on
set numberwidth=4
set number
set hid                               " solve problem of switch window

let mapleader=','                     "Remap leader to ','
set backspace=indent,eol,start        "Make backspace works like most program
set laststatus=2                  "Show the status line all the time
set nopaste
set showcmd
set t_Co=256
set visualbell                        "Disable sound

"Indentation
filetype plugin indent on
set autoindent
set expandtab
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

"Display tabs and trailing spaces visually
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

"Auto load
set autowrite
set autoread

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb

"Color Scheme and other UI
syntax enable
set background=dark
colorscheme solarized

""Set color for '~' in End of Buffer to the same as background color
highlight EndOfBuffer ctermfg=bg ctermbg=bg

"Folding
set foldnestmax=3                 "Folding: deepest fold is 3 levels
set nofoldenable                  "Folding: dont fold by default

""Solve insert mode performance
autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax       "foldmethod stays as 'syntax' when not in insert mode
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual       "foldmethod must be set to 'manual' to improve performance during editing

"Vim Faster
let g:ruby_path = system('echo $HOME/.rbenv/shims')

"Set vert line to space and set tab/trail character
set fillchars+=vert:\ |set list listchars=tab:\ \ ,trail:∙

"Search
set incsearch                     "Search: Find as you type search
set hlsearch                      "Search: Highlight search terms
set ignorecase                    "Search: Case-insensitive searching.
set smartcase                     "Search: But case-sensitive if expression contains a capital letter.
highlight IncSearch guibg=green ctermbg=green term=underline
set tags=./tags

"* General Key mapping
nnoremap ; :
nnoremap <Space> :noh<CR>

" Open current file in external app
nmap <silent> <leader>c :exec 'silent !open -a "Google Chrome" % &'<CR>
nmap <silent> <leader>a :exec 'silent !open -a "atom" % &'<CR>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Cursor shape
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" *********************************************
" *                Text Object                *
" *********************************************
" cleanup whitespace and save
nnoremap <leader><CR> :StripWhitespace<CR> \| :w<CR>

" Leave Terminal mode to Normal mode
tnoremap <C-i> <C-\><C-n>

" indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv
" *                Code helper                *
" Convert old hash to new Ruby 1.9 syntax
map <leader>: :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" Convert ' to "
map <leader>' :%s/'\([^']*\)'/"\1"/gc<CR>

" *                 Vim Test                  *
nmap <silent> <leader>. :TestLast<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>R :TestFile -strategy=basic<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <silent> <leader>r :TestNearest -strategy=basic<CR>
nmap <silent> <leader>t :TestNearest<CR>

let test#ruby#rspec#executable = "bin/rspec"
let test#strategy = "dispatch"        "Use Dispatch strategy, Plugin 'tpope/vim-dispatch' us required

" *       quickfix window.        *
let g:dispatch_quickfix_height = 17
nmap <leader>q <Plug>(qf_qf_toggle)

" *         Vim Completions Manager           *
" When using tab to navigate the suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" *         tagbar
nnoremap <silent> <Leader>? :TagbarToggle<CR>

if has("nvim")
  source ~/.vim/custom/neomake.vim
endif

source ~/.vim/custom/ctrlp.vim
source ~/.vim/custom/lightline.vim
source ~/.vim/custom/nerdtree.vim
source ~/.vim/custom/search-helper.vim
source ~/.vim/custom/vim-indent-guides.vim
source ~/.vim/custom/vim-javascript.vim
source ~/.vim/custom/vim-operator-flashy.vim
source ~/.vim/syntax.vim

" vim-haml
autocmd FileType haml setlocal foldmethod=indent

" tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1

"bufferexplorer
let g:bufExplorerShowRelativePath=1
nmap <leader>bb <leader>bs
let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitHorzSize=20

" Tabs
nmap t gt
nmap 1t 1gt
nmap 2t 2gt
nmap 3t 3gt
nmap 4t 4gt
nmap T gT

" * Other commands
" Rubocop
map <c-x> :!rubocop --auto-correct %<CR>
command! Vimrc e ~/.vimrc
command! Sovimrc so ~/.vimrc
cnoreabbrev w' w
let g:AutoPairsFlyMode = 1 " leave current pair by just typing closing pair
