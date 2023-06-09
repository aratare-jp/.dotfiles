call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'miyakogi/conoline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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
set cc=120                  " set an 120 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on

set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set backupdir=~/.cache/vim  " Directory to store backup files.
set rnu                     " Relative number

nnoremap <Space> <Nop>
let mapleader=" "

nnoremap <Leader>r :so ~/.vimrc<CR> | echo 'Reloaded'

let g:smoothie_no_default_mappings = v:true
nnoremap <C-K> <cmd>call smoothie#do("\<C-U>") <CR>
vnoremap <C-K> <cmd>call smoothie#do("\<C-U>") <CR>
nnoremap <C-J> <cmd>call smoothie#do("\<C-D>") <CR>
vnoremap <C-J> <cmd>call smoothie#do("\<C-D>") <CR>

nnoremap <C-D> ddup
vnoremap <C-D> yP

" NerdTree
nnoremap <F1> :NERDTreeToggle<CR>
inoremap <F1> :NERDTreeToggle<CR>
vnoremap <F1> :NERDTreeToggle<CR>
 
" Easymotion
nmap <Leader>j <Plug>(easymotion-overwin-f2)
 
" Move line up/down
nnoremap <C-S-K> <ESC>:m .-2<CR>
nnoremap <C-S-J> <ESC>:m .+1<CR>
vnoremap <C-S-K> :m '<-2<CR>gv=gv
vnoremap <C-S-J> :m '>+1<CR>gv=gv
 
" New line
nnoremap <C-Enter> <ESC>o<ESC>
nnoremap <S-Enter> <ESC>O<ESC>

" Split panes
nnoremap <C-p>% <ESC>:split<CR>
nnoremap <C-p>" <ESC>:vsplit<CR>

" Move panes
" nnoremap <A-S-H> <C-W>H
" nnoremap <A-S-J> <C-W>J
" nnoremap <A-S-K> <C-W>K
" nnoremap <A-S-L> <C-W>L

" Select panes
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

let g:VM_maps = {}
let g:VM_maps['Add Cursor Up'] = '<M-S-K>'
let g:VM_maps['Add Cursor Down'] = '<M-S-J>'
