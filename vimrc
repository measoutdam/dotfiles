set nocompatible
filetype off

" *********************************************
" *              Vundle Plugins                *
" *********************************************
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
Plugin 'ervandew/supertab'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'
Plugin 'Yggdroot/indentLine'
Plugin 'gabrielelana/vim-markdown'
Plugin 'wikitopian/hardmode'
Plugin 'rking/ag.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'Chiel92/vim-autoformat'
Plugin 'bogado/file-line'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'romainl/vim-qf'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'dapplebeforedawn/vim-rspec-quickfix'
Plugin 'ntpeters/vim-better-whitespace'
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

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Color Scheme
syntax enable
set background=dark
colorscheme solarized

" set noticable current line number
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNr ctermfg=15
set cursorline

" Custom for QuickFix
map <leader>co :copen<CR>

" Cursor setup
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Search
set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
highlight IncSearch guibg=green ctermbg=green term=underline

" Folding
set foldmethod=syntax             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default

"" Solve insert mode performance
autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax       "foldmethod stays as 'syntax' when not in insert mode
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual       "foldmethod must be set to 'manual' to improve performance during editing

" Vim Faster
let g:ruby_path = system('echo $HOME/.rbenv/shims')
set lazyredraw
set ttyfast
set ttyscroll=3

" lightline - status bar
set laststatus=2                  " Show the status line all the time
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [
      \             ['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename', 'modified']
      \           ],
      \   'right': [[ 'lineinfo' ], ['percent'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename' : 'LightLineFilename',
			\ },
      \ }
function! LightLineFilename() " Make a better truncated relative path for file name
	let name = ""
	let subs = split(expand('%'), "/")
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
		elseif i == 1
			let name = s
		else
			let name = parent . '/' . strpart(s, 0, 2)
		endif
		let i += 1
	endfor
  return name
endfunction
" *********************************************
" *       Normal Mode - Action Remapped       *
" *********************************************
" General Key mapping
nnoremap ss i<space><esc>
nnoremap <Space> :noh \| :echom "Search results cleared!"<CR>
nnoremap <leader>vl ^v$
nnoremap <leader>w :w!<cr>
nmap ; :

" Working with vimrc
nnoremap <leader>so :so ~/.vimrc<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Folding
nnoremap <leader>f za

" Open the definition in a new split
nnoremap <c-\> <c-w>gd<c-]>

" Shortcut for =>
imap <C-l> <Space>=><Space>

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
let g:NERDTreeStatusline = ''
autocmd StdinReadPre * let s:std_in=1
"" Jump to the main window.
autocmd VimEnter * wincmd p
let NERDTreeIgnore = ['\.swp$', '.DS_Store$', '\.ebextensions', '\.git$', '\.bundle', '.keep$']
map \ :NERDTreeToggle<CR>  " File tree browser - ackslash
map \| :NERDTreeFind<CR>   " File tree browser showing current file - pipe (shift-backslash)

" ctrlp.vim
let g:ctrlp_match_window = 'max:10'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|tmp\|.bundle\|vendor/ruby'
let g:ctrlp_dont_split = 'nerdtree'

" IndenLine
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 0
let g:indentLine_faster = 1
let g:indentLine_indentLevel = 8
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
map <leader>I :IndentLinesToggle<CR>

" Vim Hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" AG.VIM
"" Mapping
let g:ag_working_path_mode="r"

"" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
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

"" AckVisual current selection
vmap <leader>a :call AckVisual()<CR>
command! -nargs=? Ag call AckGrep(<q-args>)

"" Ack current word in command mode
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

" VIM ROBUCOP
let g:vimrubocop_config = './.rubocop.yml'
let g:vimrubocop_keymap = 0

" VIM TEST
nmap <silent> <leader>R :TestFile -strategy=basic<CR>
nmap <silent> <leader>r :TestNearest -strategy=basic<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>. :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"
let g:test#ruby#rspec#executable = "./bin/rspec"

" Toggles the quickfix window.
nmap <leader>q <Plug>(qf_qf_toggle)

" Ale - Syntax
let g:ale_linters = {'jsx': ['eslint', 'flow'], 'hcl': [], 'ruby': ['ruby', 'rubocop'], 'javascript': ['eslint', 'flow'], 'python': ['flake8']}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {'ruby': ['rubocop']}

" ALEFix - <ALT-r>
nnoremap ® :ALEFix<CR>
vnoremap ® :ALEFix<CR>

" *********************************************
" *        Local Vimrc Customization          *
" *********************************************
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
