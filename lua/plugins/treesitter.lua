return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"python",
			"html",
			"lua",
			"luadoc",
			-- "markdown",
			-- "markdown_inline",
			-- "query",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		highlight = {
			enable = true,

			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},
}

