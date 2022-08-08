local custom_attach = {}

local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

function custom_attach.on_attach(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.cmd("command! LspDefSplit lua require'telescope.builtin'.lsp_definitions{ jump_type = 'vsplit' }")
    vim.cmd("command! LspDef lua require'telescope.builtin'.lsp_definitions{}")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua require'telescope.builtin'.lsp_references{ jump_type = 'vsplit' }")
    vim.cmd("command! LspTypeDef lua require'telescope.builtin'.lsp_type_definitions{ jump_type = 'vsplit' }")
    vim.cmd("command! LspImplementation lua require'telescope.builtin'.lsp_implementations{ jump_type = 'vsplit' }")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

    buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    buf_map(bufnr, "n", "gs", ":LspDefSplit<CR>", {silent = true})
    buf_map(bufnr, "n", "gr", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gi", ":LspImplementation<CR>", {silent = true})
    buf_map(bufnr, "n", "gR", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>e", ":LspDiagNext<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>E", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>d", ":LspDiagLine<CR>", {silent = true})
end

return custom_attach
