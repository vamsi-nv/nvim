return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "neo-tree" },
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					function()
						local mode_map = {
							n = "N",
							i = "I",
							v = "V",
							V = "V",
							[""] = "V",
							c = "C",
							s = "S",
							S = "S",
							[""] = "S",
							R = "R",
							Rv = "R",
							t = "T",
						}
						local mode_code = vim.api.nvim_get_mode().mode
						return mode_map[mode_code] or mode_code
					end,
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},

			tabline = {
				lualine_x = {
					function()
						local bufs = vim.fn.getbufinfo({ buflisted = 1 })
						local current = vim.api.nvim_get_current_buf()
						local parts = {}

						for i, buf in ipairs(bufs) do
							local buf_num = buf.bufnr
							local is_modified = buf.changed == 1
							local is_current = (buf_num == current)
							local hl = is_current and "%#lualine_a_normal#" or "%#lualine_a_inactive#"

							local mod = is_modified and "*" or ""
							table.insert(parts, string.format("%s %d%s ", hl, i, mod))
						end

						return table.concat(parts)
					end,
				},
			},

			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
