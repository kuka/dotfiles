call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'yuttie/comfortable-motion.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" Syntax
Plug 'tpope/vim-commentary'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-pug'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'posva/vim-vue'
Plug 'jparise/vim-graphql'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'

" Status
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'

" color schemes: 256-friendly {{{
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-gotham'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
" }}}

" Add plugins to &runtimepath
call plug#end()

""" User Interface
if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256

" colo gruvbox
colo gotham
set background=dark

set encoding=utf8
set t_Co=256

set lazyredraw
set ttyfast

let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

let g:scratch_height=0.15
let g:jsx_ext_required = 0 " Allow JSX in .js

let g:nerdtree_tabs_open_on_console_startup=1
let g:Powerline_symbols = 'fancy'

set guioptions-=T
set guioptions+=a
set ruler
set noshowmode
set linespace=4

set wildmenu            " Popup a window showing all matching command above command line when autocomplete.

""" General
" Sets how many lines of history VIM has to remeber.
set history=100
execute pathogen#infect()

" backspace key behavior
set backspace=eol,start,indent

" temp
"
set backupdir=$TMPDIR//
set directory=$TMPDIR//

" Set to auto read when a file is changed from the outside.
set autoread

" search
set incsearch           " incremental search mode
set hlsearch            " highlight search things
set ignorecase          " ignore case when searching
set smartcase           " only works when ignorecase on

" encoding
set encoding=utf-8
set fileencodings=utf-8,latin-1,chinese

" Writing
set wrap
set linebreak
set nolist

""" Coding
syntax on
set number      " show line number
" set relativenumber " show relative line numbers
set showmatch       " show matching brackets.
set matchtime=2         " the length of time to show matching paren.

set iskeyword+=_,$,@,%,#,-  " don't linebreak when encounter these characters.

set tabstop=2       " The number of spaces count for a TAB.
set softtabstop=2   " The number of spaces inserted when typing TAB. If not expandtab, type TAB twice, will get one TAB.
set shiftwidth=2    " The number of spaces when auto-indent.
set expandtab       " Use the spaces only.

set smarttab            " Insert appropriate spaces in front of line according to shiftwidth, tabstop, softtabstop.
set autoindent
set smartindent
"set cindent            " cindent will disable smartindent, but only for C-like programming.

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

set paste               " Paste from a windows or from vim
" set go+=a               " Visual selection automatically copied to the clipboard

set autowrite       " Automatically save before commands like :next and :make
set formatoptions-=t       " Automatically save before commands like :next and :make

if has("gui_running")
  set macligatures
endif

" Loading the plugin and indentation rules according to the dectected filetype.
if has("autocmd")
  filetype plugin indent on
  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd VimEnter * NERDTree
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
  autocmd! bufwritepost .vimrc source %

  " commentaries
  autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " au BufWrite * :Autoformat

  " Remove trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  set list
  " set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
  set listchars=eol:¬,tab:>·,trail:·,extends:>,precedes:<
endif

let g:syntastic_javascript_checkers = ['eslint']

let g:gitgutter_diff_args = '-w'

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

au BufReadPost *.nunjucks set syntax=html

" Custom keys
noremap <Leader>a :Autoformat<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Show hidden files in NERDTree
let g:NERDTreeShowHidden=1

" NERDTREE
let NERDTreeWinSize=32

" Emmet
let g:user_emmet_leader_key='<tab>'
let g:user_emmet_expandabbr_key='<tab>'
let g:user_emmet_mode='a'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" indent
imap <C-Return> <CR><CR><C-o>k<Tab>

" indent line
let g:indentLine_color_gui = '#1A495B'

vnoremap . :norm.<CR>
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

" remap
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

" smooth scroll
let g:comfortable_motion_friction = 100.0
let g:comfortable_motion_air_drag = 3.0
