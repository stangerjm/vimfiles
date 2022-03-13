require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material-stealth',
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        show_modified_status = true,
        mode = 0,
        max_length = 1,
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha'
        },
        buffers_color = {
          active = 'lualine_a_normal',
          inactive = 'lualine_a_inactive',
        },
      }
    },
  },
  sections = {
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}
