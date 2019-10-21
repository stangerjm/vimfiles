" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
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

" File explorer
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" File explorer tabs
Plug 'jistr/vim-nerdtree-tabs'
map <C-n> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

" File finder
Plug 'ctrlpvim/ctrlp.vim'
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Status bar
Plug 'vim-airline/vim-airline'

" TypeScript checking and TSLint
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" Project search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" Persist undo even when exiting Vim
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Sync current document with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call SyncTree()

" Use syntax highlighting
syntax on

" Set backspace behavior to be normal
set bs=2

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

" gf opens files in a new split screen
nnoremap gf <C-W>gf

" Put arrow keys to use (directionally switch windows)
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" Indentation
set tabstop=2 softtabstop=2 expandtab shiftwidth=2
set autoindent
set shiftround
set smarttab

" Reflect file name in window title
set title

" Increase undo limit
set history=1000

" Store swap files in a separate directory
set directory^=$HOME/.vim/tmp//

" Highlight line cursor is on
set cursorline

" Don't rerender editor if unecessary
set lazyredraw

" Show matching paren, curly brace, or brackets when cursor moves over
set showmatch

