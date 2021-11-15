require('material').setup{
  custom_highlights = {
    BufferLineFill = { bg = '#121212' }
  }
}

vim.g.material_style = 'darker'
vim.cmd('colorscheme material')
