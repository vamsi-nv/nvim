return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
				sidebars = "normal", -- optional: affects sidebar windows like NvimTree
				floats = "normal", -- optional: affects floating windows
			},
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
