set nocompatible
filetype off " *********************************************
" *              Vundle Plugins               *
" *********************************************
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-textobj-quotes'      "object q, iq
Plug 'christoomey/vim-sort-motion'        "gs{motions}
Plug 'christoomey/vim-system-copy'        "cp{motion}, cP, cv
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'haya14busa/vim-operator-flashy'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-indent'            "object i, vai, vii
Plug 'kana/vim-textobj-line'              "object l, il, al
Plug 'kana/vim-textobj-user'              "requires bt vim-textobj-quotes
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
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
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'wfleming/vim-codeclimate'

" Disabled to solve performace issues
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'

call plug#end()
" *********************************************
" *               General config              *
" *********************************************
"Basic
syntax on
" set updatetime=100                    " reduce updatetime to miliseconds - helpful for gitguter
set numberwidth=4
set number
set hid                               " solve problem of switch window
source ~/.vim/syntax.vim

" set relativenumber
set showcmd
set visualbell                        "Disable sound
set backspace=indent,eol,start        "Make backspace works like most program
set nopaste
set laststatus=2                  "Show the status line all the time
set t_Co=256
let mapleader=','                     "Remap leader to ','

"Auto load
set autowrite
set autoread

"Indentation
filetype plugin indent on
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

"Display tabs and trailing spaces visually
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb
"Color Scheme and other UI
syntax enable
set background=dark
colorscheme solarized

""Set color of '~' in End of Buffer to the same as background color
highlight EndOfBuffer ctermfg=bg ctermbg=bg

"Folding
set foldnestmax=3                 "Folding: deepest fold is 3 levels
set nofoldenable                  "Folding: dont fold by default

""Solve insert mode performance
autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax       "foldmethod stays as 'syntax' when not in insert mode
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual       "foldmethod must be set to 'manual' to improve performance during editing

"Vim Faster
let g:ruby_path = system('echo $HOME/.rbenv/shims')
" set lazyredraw
" set ttyfast

"Set vert line to space and set tab/trail character
set fillchars+=vert:\ |set list listchars=tab:\ \ ,trail:∙

"Search
set incsearch                     "Search: Find as you type search
set hlsearch                      "Search: Highlight search terms
set ignorecase                    "Search: Case-insensitive searching.
set smartcase                     "Search: But case-sensitive if expression contains a capital letter.
highlight IncSearch guibg=green ctermbg=green term=underline
set tags=./tags
" General Key mapping
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
" *                Text and Line              *
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

let test#ruby#rspec#executable = "./bin/rspec"
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

source ~/.vim/custom/search-helper.vim
source ~/.vim/custom/ctrlp.vim
source ~/.vim/custom/nerdtree.vim
source ~/.vim/custom/vim-indent-guides.vim
source ~/.vim/custom/vim-operator-flashy.vim
" source ~/.vim/custom/vim-airline.vim
source ~/.vim/custom/vim-startify.vim
source ~/.vim/custom/vim-javascript.vim
" source ~/.vim/custom/vim-devicons.vim
if has("nvim")
  source ~/.vim/custom/neomake.vim
endif
" vim-haml
autocmd FileType haml setlocal foldmethod=indent

" tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1

" Rubocop
map <Alt-r> <leader>a

" lightline
" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'active': {
"       \   'left': [
"       \             ['mode', 'paste'],
"       \             ['gitbranch', 'readonly', 'filename', 'modified']
"       \           ],
"       \   'right': [[ 'lineinfo' ], ['percent'], ['filetype'] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head',
" 			\ },
"       \ }

" let g:lightline = {
"   \   'colorscheme': 'solarized',
"   \   'active': {
"   \     'left':[ [ 'mode', 'paste' ],
"   \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
"   \     ]
"   \   },
" 	\   'component': {
" 	\     'lineinfo': ' %3l:%-2v',
" 	\   },
"   \   'component_function': {
"   \     'gitbranch': 'fugitive#head',
"   \   }
"   \ }
" let g:lightline.separator = {
" 	\   'left': '', 'right': ''
"   \}
" let g:lightline.subseparator = {
" 	\   'left': '', 'right': '' 
"   \}
" Lightline
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'],['gitbranch'], ['filename'], ['modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head',
\   'modified': 'LightlineModified',
\   'filename': 'LightlineFileName',
\ },
\ }
function! LightlineModified()
  return &modified ? '✚' : ''
endfunction

function! LightlineFileName()
  return expand('%')
endfunction
" * Other commands
command! Vimrc e ~/.vimrc
command! Sovimrc so ~/.vimrc

