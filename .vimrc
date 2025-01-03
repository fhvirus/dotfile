" Adapted from https://gist.github.com/simonista/8703722
set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on

" Color scheme (terminal)
set t_Co=256
set background=dark

" Security
set nomodeline

" Misc
set number
set belloff=all
set laststatus=2
set showmode
set showcmd

" Whitespace
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Rendering
set ttyfast

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Commands for competitive programming
let mapleader=' '
set timeoutlen=2000
nmap <leader>yy :%y+<CR>
nmap <leader>pp :%d _<CR>"+P:w<CR>

ca Hash w !cpp -dD -P -fpreprocessed \| tr -d '[:space:]' \| md5sum \| cut -c-6
