return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night", -- options: 'storm', 'moon', 'night', 'day'
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		--priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- or "main", "dawn"
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			--vim.cmd("colorscheme rose-pine")
		end,
	},
}

