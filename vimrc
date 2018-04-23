set nocompatible
filetype off

" *********************************************
" *              Vundle Plugins               *
" *********************************************
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'Yggdroot/indentLine'
Plug 'gabrielelana/vim-markdown'
Plug 'wikitopian/hardmode'
Plug 'Chiel92/vim-autoformat'
Plug 'bogado/file-line'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'romainl/vim-qf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neomake/neomake'
Plug 'tonekk/vim-binding-pry'
Plug 'qpkorr/vim-bufkill'
Plug 'simeji/winresizer' " To enter resizing mode : ctrl+e, and exit by enter
Plug 'mhinz/vim-startify'
call plug#end()
"call vundle#end()

" *********************************************
" *               General config              *
" *********************************************
"Basic
syntax on
set number
set showcmd
set autoread
set visualbell                        "Disable sound
let mapleader=','                     "Remap leader to ','
set backspace=indent,eol,start        "Make backspace works like most program
set noshowmode                        "Do not show mode

"Indentation
filetype plugin indent on
set autoindent
set smartindent
set smarttab
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

set laststatus=2                  "Show the status line all the time
if !has('gui_running')            "Set terminal color to 256
  set t_Co=256
endif

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

" Toggle folding
nnoremap <leader>f za

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

" Quick simbole =>
imap <C-l> <Space>=><Space>

" *********************************************
" *              Search helper                *
" *********************************************
" Bind :Ag to :grep! with arg required
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Bind a to grep word under cursor
nnoremap <leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Bind a to greg selected word - visual mode
vmap <leader>a y:Ag '<C-R>"'<CR>

" About to execuent Ag with current word as an argument
nnoremap <leader>A :Ag<Space>'<C-R><C-W>'
" About to execuent Ag with current visual selected word as an argument
vmap <leader>A y:Ag '<C-R>"'

" The Silver Searcher - using ag when available
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" *********************************************
" *       Toggles the quickfix window.        *
" *********************************************
let g:dispatch_quickfix_height = 17
nmap <leader>q <Plug>(qf_qf_toggle)

" *********************************************
" *           Vim Operator Flashy             *
" *********************************************
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" *********************************************
" *                  Ctrlp                    *
" *********************************************
let g:ctrlp_match_window = 'max:10'         "max item in matched list
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   "for Linux/MacOSX
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|tmp\|.bundle\|vendor/ruby'
let g:ctrlp_dont_split = 'nerdtree'

" *********************************************
" *                 IndenLine                  *
" *********************************************
set list listchars=tab:\ \ ,trail:·
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 0
let g:indentLine_faster = 1
let g:indentLine_indentLevel = 8
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
map <leader>I :IndentLinesToggle<CR>

" *********************************************
" *                 Vim Test                  *
" *********************************************
nmap <silent> <leader>R :TestFile -strategy=basic<CR>
nmap <silent> <leader>r :TestNearest -strategy=basic<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>. :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"        "Use Dispatch strategy, Plugin 'tpope/vim-dispatch' us required

" *********************************************
" *                 NERDTree                  *
" *********************************************
let NERDTreeShowHidden=1            "Nerdtree is hidden by default
let NERDTreeMinimalUI = 1           "Nerdtree is load at minimal width
let NERDTreeDirArrows = 1           "Nerdtree comes with arrow for directory
let NERDTreeStatusline = ""         "Nerdtree does not have to have statusline
let NERDTreeIgnore = ['\.swp$', '.DS_Store$', '\.ebextensions', '\.git$', '\.bundle', '.keep$']     "Nerdtree's ignore Files
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1

" *********************************************
" *                 Airline                   *
" *********************************************
let g:airline_powerline_fonts = 1         "Use powerline font

"" Custom color for unsaved window
function! AirlineInit()
  " first define a new part for modified
  call airline#parts#define('modified', {
    \ 'raw': '%m',
    \ 'accent': 'red',
    \ })

  " then override the default layout for section c with your new part
  let g:airline_section_c = airline#section#create(['%<', '%f', 'modified', ' ', 'readonly'])
endfunction
autocmd VimEnter * call AirlineInit()

" *********************************************
" *             Vim Hardmode                  *
" *********************************************
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" *********************************************
" *          Asynchronous Checkers            *
" *********************************************
"" When writing a buffer (no delay).
call neomake#configure#automake('w')
" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" *********************************************
" *                  Statify                  *
" *********************************************
highlight StartifyHeader  ctermfg=77

"Set custom ascii for staify
let g:ascii = [
\'                            _',
\'                   __   __ (_)  _ __ __',
\'                   \ \ / / | | |  _ ` _ `',
\'                    \ V /  | | | | | | | |',
\'                     \_/   |_| |_| |_| |_|',]

"Align header - center
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
      \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:filter_header(startify#fortune#boxed() + g:ascii)
