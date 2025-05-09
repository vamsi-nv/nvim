return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup", -- Fancy popup for command-line
			},
			-- messages = {
			-- enabled = true,
			-- view = "notify", -- Uses `nvim-notify` for messages
			-- },
			popupmenu = {
				enabled = true, -- Enables enhanced popups
			},
			lsp = {
				progress = { enabled = false }, -- Show LSP progress messages
				hover = { enabled = false }, -- Keep normal hover
				signature = { enabled = false }, -- Keep normal signature help
			},
			presets = {
				bottom_search = true, -- Makes search UI cleaner
				command_palette = true, -- Adds a command palette
				long_message_to_split = true, -- Splits long messages into a buffer
			},
		})

		-- Use `nvim-notify` as the message UI
		-- require("notify").setup({
		-- 	background_colour = "#000000",
		-- 	render = "minimal",
		-- 	timeout = 3000,
		-- })
		-- vim.notify = require("notify")
	end,
}
