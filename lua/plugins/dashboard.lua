return -- In your plugins.lua or Lazy setup file
{
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "doom", -- other option: 'hyper'
			config = {
				header = {
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"																				",
					"███╗   ██╗ █████╗  ██████╗  █████╗     ██╗   ██╗ █████╗ ███╗   ███╗███████╗██╗",
					"████╗  ██║██╔══██╗██╔════╝ ██╔══██╗    ██║   ██║██╔══██╗████╗ ████║██╔════╝██║",
					"██╔██╗ ██║███████║██║  ███╗███████║    ██║   ██║███████║██╔████╔██║███████╗██║",
					"██║╚██╗██║██╔══██║██║   ██║██╔══██║    ╚██╗ ██╔╝██╔══██║██║╚██╔╝██║╚════██║██║",
					"██║ ╚████║██║  ██║╚██████╔╝██║  ██║     ╚████╔╝ ██║  ██║██║ ╚═╝ ██║███████║██║",
					"╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝      ╚═══╝  ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝",
					"																				",
					"																				",
					"																				",
				},
				center = {
					{ icon = "📄  ", desc = "New File", action = "enew", key = "n" },
					{ icon = "📂  ", desc = "Open File", action = "Telescope find_files", key = "f" },
					{ icon = "🔍  ", desc = "Find Word", action = "Telescope live_grep", key = "g" },
					{ icon = "⏻   ", desc = "Quit", action = "qa", key = "q" },
				},
				footer = {},
			},
		})
	end,
}
