set nocompatible
filetype off " *********************************************
" *              Vundle Plugins               *
" *********************************************
call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-textobj-quotes'      "object q, iq
Plug 'bogado/file-line'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'        "cp{motion}, cP, cv
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'haya14busa/vim-operator-flashy'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-indent'            "object i, vai, vii
Plug 'kana/vim-textobj-line'              "object l, il, al
Plug 'kana/vim-textobj-user'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'     "objec ar, ir
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'qpkorr/vim-bufkill'
Plug 'romainl/vim-qf'
Plug 'roxma/nvim-completion-manager' " pip3 install --upgrade neovim
Plug 'roxma/vim-hug-neovim-rpc' " required by nvim-completion-manager
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'simeji/winresizer' " To enter resizing mode : ctrl+e, and exit by enter
Plug 'terryma/vim-smooth-scroll'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tonekk/vim-binding-pry'
Plug 'tpope/vim-commentary'               "gc{motion}, v_gc, {number}gcc
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'                 "cs, ds, ys + {motion}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wikitopian/hardmode'

call plug#end()

" *********************************************
" *               General config              *
" *********************************************
"Basic
syntax on
set updatetime=0                      " reduce updatetime to miliseconds - helpful for gitguter
set numberwidth=4
set number
set relativenumber
set showcmd
set autoread
set visualbell                        "Disable sound
set backspace=indent,eol,start        "Make backspace works like most program
set noshowmode                        "Do not show mode
set nopaste
let mapleader=','                     "Remap leader to ','

"Vim windows
" hi VertSplit guifg=fg guibg=bg gui=NONE

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
set signcolumn=yes

"Display tabs and trailing spaces visually
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb

"Color Scheme and other UI
"syntax enable
set background=dark
colorscheme solarized

set laststatus=2                  "Show the status line all the time
set t_Co=256

""Set color of '~' in End of Buffer to the same as background color
highlight EndOfBuffer ctermfg=bg ctermbg=bg

"Search
set incsearch                     "Search: Find as you type search
set hlsearch                      "Search: Highlight search terms
set ignorecase                    "Search: Case-insensitive searching.
set smartcase                     "Search: But case-sensitive if expression contains a capital letter.
highlight IncSearch guibg=green ctermbg=green term=underline

"Folding
set foldnestmax=3                 "Folding: deepest fold is 3 levels
set nofoldenable                  "Folding: dont fold by default

""Solve insert mode performance
autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax       "foldmethod stays as 'syntax' when not in insert mode
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual       "foldmethod must be set to 'manual' to improve performance during editing

"Vim Faster
let g:ruby_path = system('echo $HOME/.rbenv/shims')
set lazyredraw
set ttyfast

" tab character
set list listchars=tab:\ \ ,trail:∙

" *********************************************
" *               Action Remapped             *
" *********************************************
" General Key mapping
nnoremap <leader>w :w!<cr>
nnoremap ; :
map <leader>co :copen<CR>
" Working with vimrc
nnoremap <leader>so :so ~/.vimrc<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" *********************************************
" *                Text object                *
" *********************************************
" clear search result and whitespace
nnoremap <Space> :noh \| :StripWhitespace<CR>

" Inner Line selection
nnoremap <leader>vil ^vg_
nnoremap <leader>val 0v$g

" replace current word with latest in reg
nnoremap <leader>p viw"0p
vmap <leader>p "0p

" Delete without storing in register
nnoremap <leader>d "_d

" Leave Terminal mode to Normal mode
tnoremap <Esc> <C-\><C-n>

" indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv
" *********************************************
" *                Ruby helper                *
" *********************************************
" Convert old hash to new Ruby 1.9 syntax
map <leader>: :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" Convert ' to "
map <leader>' :%s/'\([^']*\)'/"\1"/gc<CR>

" *********************************************
" *              Search helper                *
" *********************************************
" The Silver Searcher - using ag when available
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
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

" *********************************************
" *       Toggles the quickfix window.        *
" *********************************************
let g:dispatch_quickfix_height = 17
nmap <leader>q <Plug>(qf_qf_toggle)

" *           Vim Operator Flashy             *

" *                 Vim Test                  *
nmap <silent> <leader>R :TestFile -strategy=basic<CR>
nmap <silent> <leader>r :TestNearest -strategy=basic<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>. :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#ruby#rspec#executable = "./bin/rspec"
let test#strategy = "dispatch"        "Use Dispatch strategy, Plugin 'tpope/vim-dispatch' us required

" *               Smooth scroll               *
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>


" *         Vim Completions Manager           *
" When using tab to navigate the suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


source ~/.vim/custom/vim-operator-flashy.vim
source ~/.vim/custom/ctrlp.vim
source ~/.vim/custom/vim-airline.vim
source ~/.vim/custom/vim-startify.vim
source ~/.vim/custom/tmux-line.vim
source ~/.vim/custom/vim-devicons.vim
source ~/.vim/custom/nerdtree.vim
source ~/.vim/custom/vim-indent-guides.vim
