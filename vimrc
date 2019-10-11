" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" Themes
Plug 'flrnprz/plastic.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" JavaScript autocomlete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

" File Explorer
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" end vim-plug
call plug#end()

let g:vim_jsx_pretty_colorful_config = 1

set encoding=UTF-8

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

