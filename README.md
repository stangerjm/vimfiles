Vim config files
================

Key
----
* `<leader>`: <space>

Mappings
--------
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
    * This uses a plugin called [kommentary](https://github.com/b3nj5m1n/kommentary)
* Clear previous search: `,`
* Quick close current buffer: `<space> q`
