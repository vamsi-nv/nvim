return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = " ", right = "" },
				section_separators = { left = "", right = "" },
				isabled_filetypes = {
					statusline = { "neo-tree" }, -- disable lualine in neo-tree buffer
					winbar = {},
				},
			},
			sections = {
				lualine_a = {
					function()
						local mode_map = {
							["n"] = "N",
							["no"] = "N",
							["i"] = "I",
							["ic"] = "I",
							["v"] = "V",
							["V"] = "V",
							[""] = "V",
							["c"] = "C",
							["s"] = "S",
							["S"] = "S",
							[""] = "S",
							["R"] = "R",
							["Rv"] = "R",
							["t"] = "T",
						}
						return mode_map[vim.api.nvim_get_mode().mode] or ""
					end,
				},
				lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "neo-tree" }, -- include neo-tree so it plays nicely
		})
	end,
}
