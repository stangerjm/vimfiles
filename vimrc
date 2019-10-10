


" Show number lines
set number

" When searching, highlight results
:set incsearch
:set hlsearch

" Map the space key to a command that clears the previous search
:map <SPACE> :let @/=""<CR>

" Use 2 spaces instead of tabs
set tabstop=2 softtabstop=2 expandtab shiftwidth=2

" Persist undo even when exiting Vim
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Use syntax highlighting
syntax on
