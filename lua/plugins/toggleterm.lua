return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		vim.o.shell = "powershell"
		vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
		vim.o.shellquote = ""
		vim.o.shellxquote = ""

		require("toggleterm").setup({
			size = 50,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal", -- can be 'vertical' | 'float' | 'tab'
			close_on_exit = true,
			shell = vim.o.shell,
		})

		-- Keybindings
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true, desc = "" }

		keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle horizontal terminal" })
		keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
		keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

		-- Optional: Esc twice to exit terminal mode
		vim.cmd([[
      tnoremap <Esc><Esc> <C-\><C-n>
    ]])
	end,
}
