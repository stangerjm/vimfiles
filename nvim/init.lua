-- Use syntax highlighting (must be before initializing LSP or syntax highlighting plugins)
vim.cmd('syntax enable')

-- Theme config
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd('colorscheme palenight')

require('plugins')
require('keymap')

-- Language-server config and autocomplete
vim.o.completeopt = 'menuone,noselect'

-- Search config
vim.o.incsearch = true
vim.o.hlsearch = true

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.shiftround = true
vim.o.smarttab = true

-- Increase undo limit and persist undo even after closing vim
vim.o.history = 1000
vim.o.undodir = '~/.vim/undodir'
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000

-- Store swap files in a separate directory
vim.o.directory = vim.o.directory .. '$HOME/.vim/tmp//'

-- Highlight line cursor is on
vim.o.cursorline = true

-- Don't rerender editor if unecessary
vim.o.lazyredraw = true

-- Show matching paren, curly brace, or brackets when cursor moves over
vim.o.showmatch = true

-- Disable automatic newline inserts
vim.o.tw = 0
vim.cmd('autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1')

-- Let Vim make decision on whether to do a case sensitive or insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep cursor the same as the terminal cursor
vim.o.guicursor = ''

-- Explicitly disable the old regex engine
vim.o.re = 0

-- General config
vim.o.encoding = 'utf-8'
vim.o.number = true
vim.o.bs = '2'
vim.o.title = true
vim.o.showtabline = 2
vim.o.updatetime = 300

-- Add nice colors to vimdiff
if (vim.opt.diff:get()) then
  vim.o.cursorline = true
  vim.api.nvim_set_keymap('', ']', ']c', {})
  vim.api.nvim_set_keymap('', '[', '[c', {})
  vim.cmd[[
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
  ]]
end

vim.g['@d'] = '0i* j0dtbi  t-llDwwd$kkA pjddddddi  o'
vim.g['@c'] = '0i* j0dtbi  t-llDjj0d$kkA pjdd'
