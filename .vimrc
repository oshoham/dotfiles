set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'sjl/vitality.vim'

filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set number
set bs=2
set ai
set smartindent
syntax on
set mouse=a
set hlsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>

set ignorecase          " search without caring of case
set smartcase           " only ignore case when lowercase
set pastetoggle=<F5>    " used for pasting in data

set t_Co=256
set background=dark
let g:rehash256 = 1
colorscheme jellybeans

autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"
