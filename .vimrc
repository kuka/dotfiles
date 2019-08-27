call plug#begin('~/.vim/plugged')

" Editing
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/limelight.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jparise/vim-graphql'
Plug 'yggdroot/indentline'

" Syntax
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-liquid'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" HTML
Plug 'othree/html5.vim'

" CSS
Plug 'cakebaker/scss-syntax.vim'

" JS
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'typescript'] }
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'

" CJS
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
" static support for lein.
Plug 'tpope/vim-salve'

" Status
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'

" color schemes
Plug 'trusktr/seti.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'flazz/vim-colorschemes'
Plug 'whatyouhide/vim-gotham'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Add plugins to &runtimepath
call plug#end()

let g:airline_powerline_fonts = 1

let g:scratch_height=0.15
let g:jsx_ext_required = 0 " Allow JSX in .js

let g:nerdtree_tabs_open_on_console_startup=1
let g:Powerline_symbols = 'fancy'

set guioptions-=T
set guioptions+=a

set lazyredraw
set ttyfast
set visualbell
set ruler
set noshowmode
set cursorline

set wildmenu            " Popup a window showing all matching command above command line when autocomplete.

""" General
" Sets how many lines of history VIM has to remeber.
set history=100
execute pathogen#infect()

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
  filetype indent on
  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd VimEnter * NERDTree

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Remove trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  set list
  " set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
  set listchars=eol:¬,tab:>·,trail:·,extends:>,precedes:<
endif

let g:gitgutter_diff_args = '-w'

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif

" JS
let g:jsx_ext_required = 0

" ALE
let g:ale_linters = { 'javascript': ['eslint'] }

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'

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

" " indent line
let g:indentLine_color_gui = '#1A495B'

let g:html_indent_inctags = "html,body,head,tbody"

vnoremap . :norm.<CR>
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

" remap
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

filetype plugin indent on

""" User Interface
if (has("termguicolors"))
  set termguicolors
endif

" let base16colorspace=256

colo seti
" colo gruvbox
" colo gotham256
set background=dark

set encoding=utf8
set t_Co=256

" backspace key behavior
set backspace=eol,start,indent

set linespace=4

set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set expandtab " expand tabs by default (overloadable per file type)
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2 " number of spaces to use for autoindenting

set smartindent
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=2 " tabs are n spaces
