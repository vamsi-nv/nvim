return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", 
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false, -- Show dotfiles
				hide_gitignored = false, -- Show git-ignored files
			},
			follow_current_file = {
				enabled = true, -- Auto-focus the current file
			},
			window = {
				position = "left",
				width = 25,
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
