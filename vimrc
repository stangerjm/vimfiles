" Remap leader
let mapleader=" "
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>

" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

" JS/TS syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 1

" GQL syntax highlighting
Plug 'jparise/vim-graphql'

" Bash support
Plug 'WolfgangMehner/bash-support'

" File explorer
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize=70

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
nnoremap <leader>d :Gdiffsplit<CR>

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
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'

  let g:deoplete#enable_at_startup = 1

  Plug 'neoclide/coc.nvim', { 'branch' : 'release', 'do' : './plugged/coc.nvim/install.sh' }
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Quramy/tsuquyomi'
  let g:tsuquyomi_disable_quickfix = 1
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

endif

" Comment toggling
Plug 'tomtom/tcomment_vim'
nnoremap <leader>c :TComment<CR>
vnoremap <leader>c :TComment<CR>

" Themes
Plug 'flrnprz/plastic.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" File finder
Plug 'ctrlpvim/ctrlp.vim'
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Status bar
Plug 'vim-airline/vim-airline'

" Project search
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Undo tree visualizer
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<cr>

" Markdown syntax highlighting
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" Markdown preview
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" let g:mkdp_open_to_the_world = 1
" let g:mkdp_open_ip = '10.2.80.12' " change to you vps or vm ip
" let g:mkdp_port = 8080
" function! g:EchoUrl(url)
"     :echo a:url
" endfunction
" let g:mkdp_browserfunc = 'g:EchoUrl'
" let g:mkdp_auto_start = 1
" let g:mkdp_auto_close = 1
" let g:mkdp_page_title = '${name}'

" Better VIM Movement
Plug 'chaoren/vim-wordmotion'

" (MUST BE AT END) Enable icons for file explorer
Plug 'ryanoasis/vim-devicons'

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
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" Ensure Background highlighting works as expected
:set t_ut=""

" gf opens files in a new split screen
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

" Quick open Ack
nnoremap <leader>a :Ack! 

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
nnoremap <leader>p "*p

set guicursor=a:ver50-blinkon1
au VimLeave * set guicursor=a:ver50-blinkon1

set updatetime=300

" Make sure the popup window is a nice color that doesn't hide any characters
highlight Pmenu ctermbg=DarkGray guibg=gray

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
