call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'keith/swift.vim'
Plug 'taterbase/1989.vim'
Plug 'fatih/vim-go'
Plug 'catppuccin/vim'
Plug 'rust-lang/rust.vim'

call plug#end()

set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set scrolloff=5
set history=200
set smartindent
set background=dark
colorscheme 1989
syntax on

" Tabs should be rendered as two spaces
set tabstop=2
" Shifting a line back or forward a tab should respect tabstop
set shiftwidth=0

filetype plugin indent on    " required

" Use new regex engine
" set re=0

" Rust configs
let g:rustfmt_autosave=1
