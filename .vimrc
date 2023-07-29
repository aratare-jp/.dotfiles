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
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'git@github.com:hashivim/vim-terraform.git'
Plug 'git@github.com:terryma/vim-expand-region.git'
call plug#end()

" Load common configuration
source ~/.commonvimrc

" Configuration
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 120 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set backupdir=~/.cache/vim  " Directory to store backup files.

" Enable line highlight
let g:conoline_auto_enable = 1

" Reload configuration
nnoremap <Leader>r :so ~/.vimrc<CR> | echo 'Reloaded'

" Smooth scrolling
let g:smoothie_no_default_mappings = v:true
nnoremap <C-K> <cmd>call smoothie#do("\<C-U>") <CR>
vnoremap <C-K> <cmd>call smoothie#do("\<C-U>") <CR>
nnoremap <C-J> <cmd>call smoothie#do("\<C-D>") <CR>
vnoremap <C-J> <cmd>call smoothie#do("\<C-D>") <CR>

" Split panes
nnoremap <Leader>% <ESC>:split<CR>
nnoremap <Leader>" <ESC>:vsplit<CR>

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

" Multi cursor
nnoremap <Leader>$k <Nop>
nnoremap <Leader>$j <Nop>
let g:VM_maps = {}
let g:VM_maps['Add Cursor Up'] = '<Space>$k'
let g:VM_maps['Add Cursor Down'] = '<Space>$j'

" LazyGit
nnoremap <silent> <F10> :LazyGit<CR>

function! ShowFindReplacePopup()
  " Calculate the width and height of the popup window
  let width = 40
  let height = 5

  " Calculate the centered position of the popup window
  let row = (winheight(0) - height) / 2
  let col = (winwidth(0) - width) / 2

  " Create a new buffer for the popup window
  let buf_id = nvim_create_buf(0, 1)

  " Set the contents of the buffer
  call nvim_buf_set_lines(buf_id, 0, -1, 0, ['Find:', '', 'Replace:', ''])

  " Create a new floating window for the popup
  let win_id = nvim_open_win(buf_id, 1, {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal',
        \ 'border': 'rounded',
        \ })

  " Set the buffer options for the popup window
  call nvim_buf_set_option(buf_id, 'buftype', 'nofile')
  call nvim_buf_set_option(buf_id, 'bufhidden', 'wipe')
  call nvim_buf_set_option(buf_id, 'swapfile', 0)
  setlocal wrap
  setlocal filetype=vim

  " Position the cursor on the first input field
  call win_execute(win_id, 'normal! 1G')

  " Retrieve and echo back the user input
  let find = input('Enter search text: ')
  let replace = input('Enter replacement text: ')
  echo 'You entered: ' . find . ' for find and ' . replace . ' for replace.'

  " Close the popup window
  call win_close(win_id)
endfunction

command! FindReplacePopup call ShowFindReplacePopup()
