local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Bash/Fish support
  use 'WolfgangMehner/bash-support'
  use 'dag/vim-fish'

  -- File manager/explorer
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'kdheepak/lazygit.nvim'

  -- Test runner
  use 'vim-test/vim-test'

  -- Language-server config and autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Snippet integration for autocompletion support
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Comment toggling
  use 'tomtom/tcomment_vim'

  -- Theme
  use 'drewtempelmeyer/palenight.vim'

  -- Status bar
  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Undo tree visualizer
  use 'mbbill/undotree'

  -- Better VIM Movement
  use 'chaoren/vim-wordmotion'

  -- Enable icons for file explorer
  use 'kyazdani42/nvim-web-devicons'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
