return {

	{
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"echasnovski/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup({
				mappings = {
					left = "<A-Left>",
					right = "<A-Right>",
					down = "<A-Down>",
					up = "<A-Up>",

					line_left = "<A-Left>",
					line_right = "<A-Right>",
					line_down = "<A-Down>",
					line_up = "<A-Up>",
				},
			})
		end,
	},

	{
		"echasnovski/mini.tabline",
		version = "*",
		config = function()
			require("mini.tabline").setup({
				show_icons = true, -- set to true if you want filetype icons (requires nerd fonts + plugin)
				set_vim_settings = true, -- true = auto set `showtabline` and `tabline`
			})
		end,
	},
}
