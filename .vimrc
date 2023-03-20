call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'miyakogi/conoline.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:conoline_auto_enable = 1

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on

set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set backupdir=~/.cache/vim  " Directory to store backup files.
set rnu                     " Relative number

" Alt+F1 = NerdTree
nnoremap <F49> :NERDTreeToggle<CR>
inoremap <F49> :NERDTreeToggle<CR>
vnoremap <F49> :NERDTreeToggle<CR>

" Alt+S = Jump
map <M> <Plug>(easymotion-prefix)
nmap <M-s> <Plug>(easymotion-overwin-f2)

" Move line up/down
nnoremap <C-S-K> <ESC>:m .-2<CR>
nnoremap <C-S-J> <ESC>:m .+1<CR>
vnoremap <C-S-K> :m '<-2<CR>gv=gv
vnoremap <C-S-J> :m '>+1<CR>gv=gv

" New line
nnoremap <C-Enter> <ESC>o<ESC>
nnoremap <S-Enter> <ESC>O<ESC>
