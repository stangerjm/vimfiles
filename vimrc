" Remap leader
let mapleader=" "
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>

" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

" JS/TS syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
let g:yats_host_keyword = 0

let g:vim_jsx_pretty_colorful_config = 1

" GQL syntax highlighting
Plug 'jparise/vim-graphql'

" Bash support
Plug 'WolfgangMehner/bash-support'

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

" File explorer
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize=70

" File explorer tabs
nnoremap <leader>n :call SyncTree()<CR>

" Sync current document with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  " Only search for the file if NERDTree isn't already open, there is a modifiable file in the window, and vim isn't in diff
  if !IsNERDTreeOpen() && &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

" JavaScript / TypeScript features / tools
if has('nvim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-spell-checker']
  autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <leader>rn <Plug>(coc-rename)
  nmap <leader>e <Plug>(coc-diagnostic-next)
  nmap <leader>E <Plug>(coc-diagnostic-prev)
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  inoremap <silent><expr> <C-c> coc#refresh()
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  vmap <leader>s <Plug>(coc-codeaction-selected)
  nmap <leader>s <Plug>(coc-codeaction-selected)

  set shortmess+=c

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocActionAsync('doHover')
    endif
  endfunction

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

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
Plug 'ryanoasis/vim-devicons'
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

" Set cursor to blink and reset when Vim closes
set guicursor=a:ver50-blinkon1
au VimLeave * set guicursor=a:ver50-blinkon1

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

" Telescope config
lua << EOF
  local actions = require('telescope.actions')
  -- Global remapping
  ------------------------------
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
      borderchars = { '─', '┃', '─', '│', '┌', '┐', '┘', '└' },
    }
  }
EOF
