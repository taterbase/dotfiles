set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'keith/swift.vim'
Plugin 'taterbase/1989.vim'
Plugin 'fatih/vim-go'
Plugin 'catppuccin/vim'
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

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
