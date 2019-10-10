" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'flrnprz/plastic.vim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

" end vim-plug
call plug#end()

let g:vim_jsx_pretty_colorful_config = 1

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

" " Use all colors and set background to dark
set t_Co=256
set background=dark

" " Plastic
" colorscheme plastic
" let g:lightline = { 'colorscheme': 'plastic' }

colorscheme onehalfdark 
let g:airline_theme='onehalfdark'

" Ensure Background highlighting works as expected
:set t_ut=""

