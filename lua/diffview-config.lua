local cb = require('diffview.config').diffview_callback

require('diffview').setup{
  key_bindings = {
    file_panel = {
      ['<cr>'] = cb('focus_entry'),
    },
    view = {
      ['<leader>h'] = cb('focus_files'),
    },
  },
}
