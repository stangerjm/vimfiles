local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- Theme
  use {
    'marko-cerovac/material.nvim',
    config = function() require('material-config') end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('bufferline-config') end
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('treesitter-config') end
  }

  -- File manager/explorer
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('telescope-config') end
  }

  -- Git
  use 'kdheepak/lazygit.nvim'

  -- Test runner
  use 'vim-test/vim-test'

  -- Language-server config and autocomplete
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('ts-lsp-config')
      require('lua-lsp-config')
    end
  }

  use {
    'hrsh7th/nvim-compe',
    config = function() require('compe-config') end
  }

  -- Snippet integration for autocompletion support
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Comment toggling
  use 'tomtom/tcomment_vim'

  -- Status bar
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine-config') end
  }

  -- Better VIM Movement
  use 'chaoren/vim-wordmotion'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    opt = true,
    cmd = 'NvimTreeToggle',
    config = function() require'nvim-tree-config' end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
