Vim config files
================

Key
----
* `<space>`: spacebar
* `<ctrl>`: Control key

Mappings
--------
* Toggle file manager: `<space> n` (hitting this again with the file manager open will close it)
    * This uses a plugin called [NerdTree](https://github.com/preservim/nerdtree)
* Fuzzy file search: `<ctrl> p` and then start typing
    * This uses a plugin called [ctrlp](https://github.com/kien/ctrlp.vim)
* Project search `<space> a`: 
    * This uses a plugin called [ag](https://github.com/rking/ag.vim)
* Coc mappings (see [coc.nvim](https://github.com/neoclide/coc.nvim))
    * Go to definition (in JS/TS file): `gd`
    * Go to reference: `gr`
    * Go to type definition: `gy`
    * Go to implementation: `gi`
    * Rename: `rn`
    * Go to next lint/TS error: `<space> e`
    * Show documentation: `K`
* View Git diff: `<space> d`
    * This uses a plugin called [vim-fugitive](https://github.com/tpope/vim-fugitive)
* Toggle comment: `<space> c`
    * This uses a plugin called [tcomment_vim](https://github.com/tomtom/tcomment_vim)
* View undo history: `<space> u`
    * This uses a plugin called [undotree](https://github.com/mbbill/undotree)
* Clear previous search: `,`
* Quick close all tabs: `<space> q`
* Quick close all but current tab: `<space> t`
