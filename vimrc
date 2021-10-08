" Remap leader
let mapleader=" "
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>

" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

" Awesome syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Bash/Fish support
Plug 'WolfgangMehner/bash-support'
Plug 'dag/vim-fish'

" File manager
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fn <cmd>Telescope file_browser<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>

" Git integration
Plug 'kdheepak/lazygit.nvim'
nnoremap <silent> <leader>lg :LazyGit<cr>

" Test runner
Plug 'vim-test/vim-test'
nnoremap <leader>g :TestFile<CR>
let test#strategy = 'neovim'

" Easily exit terminal insert mode
tmap <leader>i <C-\><C-n>

" File explorer
Plug 'kyazdani42/nvim-tree.lua'
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>rt :NvimTreeRefresh<CR>
highlight NvimTreeFolderIcon guibg=blue

" Language-server config and autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
set completeopt=menuone,noselect

" Snippet integration for autocompletion support
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Comment toggling
Plug 'tomtom/tcomment_vim'
nnoremap <leader>c :TComment<CR>
vnoremap <leader>c :TComment<CR>

" Theme
Plug 'drewtempelmeyer/palenight.vim'

" Status bar
Plug 'vim-airline/vim-airline'

" Undo tree visualizer
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<cr>

" Better VIM Movement
Plug 'chaoren/vim-wordmotion'

" (MUST BE AT END) Enable icons for file explorer
Plug 'kyazdani42/nvim-web-devicons'

" end vim-plug
call plug#end()

set encoding=utf-8

" Show number lines
set number

" When searching, highlight results
:set incsearch
:set hlsearch

" Map the ',' key to a command that clears the previous search
:map , :let @/=""<CR>

" Use syntax highlighting
syntax enable

" Set backspace behavior to be normal
set bs=2

" Ruby support
let g:ruby_host_prog = "/local/home/jastange/.rbenv/versions/2.5.8/bin/neovim-ruby-host"

" " Use all colors and set background to dark
set t_Co=256
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif

" Theme
colorscheme palenight "Love it too!!
let g:airline_theme = "palenight"

" Configure Airline sections
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" Ensure Background highlighting works as expected
:set t_ut=""

" gf opens files in a new buffer
nnoremap gf <C-W>gf

" Put arrow keys to use (directionally switch windows)
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" Also allow normal directional keys move windows
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <silent> <leader>zi <C-w><Bar>
nnoremap <leader>zo <C-w>=


" Quick source of vimrc
nnoremap <leader>r :so ~/.vim/vimrc<CR>

" Easy scroll
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>

" Indentation
set tabstop=2 softtabstop=2 expandtab shiftwidth=2
set autoindent
set shiftround
set smarttab

" Reflect file name in window title
set title

" Ensure tab display appears even if one buffer is open
set showtabline=2

" Increase undo limit and persist undo even after closing vim
set history=1000
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Store swap files in a separate directory
set directory^=$HOME/.vim/tmp//

" Highlight line cursor is on
set cursorline

" Don't rerender editor if unecessary
set lazyredraw

" Show matching paren, curly brace, or brackets when cursor moves over
set showmatch

" Vertical movements should not skip wrapped lines
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" Disable automatic newline inserts
set tw=0
autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1

" Let Vim make decision on whether to do a case sensitive or insensitive search
set ignorecase
set smartcase

" Add nice colors to vimdiff
if &diff
    set cursorline
    map ] ]c
    map [ [c
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

" Map quick folding
nnoremap <leader>f zf

" Map quick close all tabs
nnoremap <leader>q :bufdo bdelete<CR>

" Map quick close all tabs
nnoremap <leader>t :tabonly<CR>

nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Keep cursor the same as the terminal cursor
set guicursor=

set updatetime=300

" Macros for CMs
let @d = '0i* j0dtbi  t-llDwwd$kkA pjddddddi  o'
let @c = '0i* j0dtbi  t-llDjj0d$kkA pjdd'

" Close all tabs to the left or to the right
function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')

nnoremap <leader>xl :Tabcloseleft<CR>
nnoremap <leader>xr :Tabcloseright<CR>

" Explicitly disable the old regex engine
set re=0

lua require('lsp-config')
lua require('telescope-config')
lua require('treesitter-config')
lua require('compe-config')
lua require('nvim-tree-config')
