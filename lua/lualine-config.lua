require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
  },
  sections = {
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}
