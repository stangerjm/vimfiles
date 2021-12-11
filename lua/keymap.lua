--[[
  Wrapper around vim.api.nvim_set_keymap

  Properties
    key (required)
    cmd (required)
    mode = 'n'
    options = { noremap = true }
]]--
local function map(args)
  local key = args.key or nil
  local cmd = args.cmd or nil
  local mode = args.mode or 'n'
  local options = args.options or { noremap = true }
  vim.api.nvim_set_keymap(mode, key, cmd, options)
end

-- Remap leader to <Space>
vim.g.mapleader = ' '
map{ key = '<Space>', cmd = '', options = {} }
map{ mode = 'v', key = '<Space>', cmd = '', options = {} }

-- Find files using Telescope
map{ key = '<leader>ff', cmd = '<cmd>Telescope find_files<cr>' }
map{ key = '<leader>fg', cmd = '<cmd>Telescope live_grep<cr>' }
map{ key = '<leader>fb', cmd = '<cmd>Telescope buffers<cr>' }
map{ key = '<leader>fh', cmd = '<cmd>Telescope help_tags<cr>' }
map{ key = '<leader>fn', cmd = '<cmd>Telescope file_browser<cr>' }
map{ key = '<C-p>', cmd = '<cmd>Telescope find_files<cr>' }

-- LazyGit
map{ key = '<leader>vg', cmd = ':LazyGit<CR>', options = { silent = true, noremap = true } }

-- Toggle git blame
map{ key = '<leader>b', cmd = ':GitBlameToggle<CR>' }

-- Test runner
map{ key = '<leader>g', cmd = ':TestFile<CR>' }
vim.g['test#strategy'] = 'neovim'

-- File explorer
map{ key = '<leader>n', cmd = ':NvimTreeToggle<CR>' }
map{ mode = 'n', key = '<leader>rt', cmd = ':NvimTreeRefresh<CR>' }

-- Comment toggling
map{ mode = 'n', key = '<leader>c', cmd = '<Plug>kommentary_line_default', options = {} }
map{ mode = 'n', key = '<leader>mc', cmd = '<Plug>kommentary_motion_default', options = {} }
map{ mode = 'x', key = '<leader>c', cmd = '<Plug>kommentary_visual_default', options = {} }

-- Also allow normal directional keys move windows
map{ key = '<leader>l', cmd = '<C-w>l' }
map{ key = '<leader>h', cmd = '<C-w>h' }
map{ key = '<leader>k', cmd = '<C-w>k' }
map{ key = '<leader>j', cmd = '<C-w>j' }

-- Easy scroll
map{ key = '<C-k>', cmd = '<C-y>' }
map{ key = '<C-j>', cmd = '<C-e>' }

-- Vertical movements should not skip wrapped lines
map{ key = 'j', cmd = 'gj' }
map{ key = 'k', cmd = 'gk' }

-- highlight last inserted text
map{ key = 'gV', cmd = '`[v`]' }

-- Quick folding
map{ key = '<leader>f', cmd = 'zf' }

-- Close current buffer
map{ key = '<leader>q', cmd = ':bd<CR>' }

-- Copy/paste helpers
map{ key = '<leader>y', cmd = '"*y' }
map{ mode = 'v', key = '<leader>y', cmd = '"*y' }
map{ key = '<leader>p', cmd = '"*p' }
map{ mode = 'v', key = '<leader>p', cmd = '"*p' }

-- Map the ',' key to a command that clears the previous search
map{ mode = '', key = ',', cmd = ':let @/=""<CR>' }

-- Open and close floating terminal
map{ key = '<A-i>', cmd = '<CMD>lua require("FTerm").toggle()<CR>', options = { silent = true, noremap = true } }
map{ mode = 't', key = '<A-i>', cmd = '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', options = { silent = true, noremap = true } }
