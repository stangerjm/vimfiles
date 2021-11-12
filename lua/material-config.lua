require('material').setup{
  custom_highlights = {
    BufferLineFill = { bg = '#141b1e' }
  }
}

vim.g.material_style = 'darker'
vim.cmd('colorscheme material')
