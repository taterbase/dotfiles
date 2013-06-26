set nocompatible

filetype on  "make sure it's on first, otherwise bad exit code
filetype off "Required for Vundle

" Using vundle
" Install with git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'taterbase/Colour-Sampler-Pack.git'
Bundle 'taterbase/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/gist-vim'
Bundle 'wlangstroth/vim-haskell'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'mattn/webapi-vim'
Bundle 'walm/jshint.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'godlygeek/tabular'
Bundle 'jnwhiteh/vim-golang'
Bundle 'scrooloose/nerdtree'
Bundle 'nono/vim-handlebars'
Bundle 'wavded/vim-stylus'
Bundle 'othree/html5.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'davidoc/taskpaper.vim'

" My settings
nmap j gj
nmap k gk
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set softtabstop=2
set shiftwidth=2
set expandtab
set scrolloff=5
set history=200
set smartindent
set background=dark
colorscheme lucius
syntax on
filetype plugin indent on

" Go
set rtp+=$GOROOT/misc/vim

let &t_Co=256

"***** GIST SETUP *****"

"Private gists by default
let g:gist_post_private = 1

"Open web browser after making gist
let g:gist_open_browser_after_post = 1

"Copy gist to clipboard
let g:gist_clip_comman = 'pbcopy'

"Detect file type when gisting
let g:gist_detect_filetype = 1

"***** END GIST SETUP *****"

"Remap leader key
let mapleader=","
nnoremap <leader>a :echo("\<leader\> works! It is set to <leader>")<CR>

"Prevent auto-comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Auto-closing of braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

"Auto-closing of brackets
inoremap [       []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"Auto-closing parens
inoremap (      ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

"Tab completion (home made)
inoremap <expr> <Tab> AutoComplete() 
inoremap <expr> <S-Tab> ShiftAutoComplete()

func AutoComplete()
  let str = strpart(getline('.'), col('.')-2, 1)

  if !match(str, "[A-Za-z1-9]")
    return "\<C-N>"
  else
    return "\<Tab>"
endfunc

func ShiftAutoComplete()
  let str = strpart(getline('.'), col('.')-2, 1)

  if !match(str, "[A-Za-z1-9]")
    return "\<C-P>"
  else
    return "\<Tab>"
endfunc

"Typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Remove trailing whitespace from files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,coffeescript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
