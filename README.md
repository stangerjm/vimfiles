Vim config files
================

Key
----
* `<space>`: spacebar
* `<ctrl>`: Control key

Mappings
--------
* Toggle file manager: `<space> n` (hitting this again with the file manager open will close it)
    * This uses a plugin called [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
* Fuzzy file search: `<ctrl> p` and then start typing
    * This uses a plugin called [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* Project search `<space> fg`: 
    * This also uses [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* LSP mappings (see [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig))
    * Go to definition (in JS/TS file): `gd`
    * Go to reference: `gr`
    * Go to type definition: `gy`
    * Go to implementation: `gi`
    * Rename: `rn`
    * Go to next lint/TS error: `<space> e`
    * Show documentation: `K`
* Toggle comment: `<space> c`
    * This uses a plugin called [tcomment_vim](https://github.com/tomtom/tcomment_vim)
* View undo history: `<space> u`
    * This uses a plugin called [undotree](https://github.com/mbbill/undotree)
* Clear previous search: `,`
* Quick close all tabs: `<space> q`
* Quick close all but current tab: `<space> t`
