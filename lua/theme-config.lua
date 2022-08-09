vim.g.material_style = "deep ocean"

require('material').setup({
	disable = {
		colored_cursor = true,
	},
})

vim.cmd 'colorscheme material'
