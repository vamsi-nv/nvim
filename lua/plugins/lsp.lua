return {

	-- Lua LSP Enhancer
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- Main LSP Setup
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- { "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			{
				"xiyaowong/snacks.nvim",
				config = true,
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					map("grr", function()
						require("snacks.lsp").references()
					end, "[G]oto [R]eferences")
					map("grd", function()
						require("snacks.lsp").definitions()
					end, "[G]oto [D]efinition")
					map("gri", function()
						require("snacks.lsp").implementations()
					end, "[G]oto [I]mplementation")
					map("grt", function()
						require("snacks.lsp").type_definitions()
					end, "[G]oto [T]ype")
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gO", function()
						require("snacks.lsp").document_symbols()
					end, "Document Symbols")
					map("gW", function()
						require("snacks.lsp").workspace_symbols()
					end, "Workspace Symbols")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "Toggle Inlay Hints")
					end
				end,
			})

			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				virtual_text = {
					spacing = 2,
					source = "if_many",
					format = function(d)
						return d.message
					end,
				},
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚",
						[vim.diagnostic.severity.WARN] = "󰀪",
						[vim.diagnostic.severity.INFO] = "󰋽",
						[vim.diagnostic.severity.HINT] = "󰌶",
					},
				} or {},
			})

			-- Capabilities
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- LSP Servers
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							diagnostics = { globals = { "vim" } },
						},
					},
				},
				-- more servers here
			}

			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, { "stylua", "pyright" })

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				automatic_installation = false,
				handlers = {
					function(server_name)
						local opts = servers[server_name] or {}
						opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
						require("lspconfig")[server_name].setup(opts)
					end,
				},
			})
		end,
	},

	-- Blink Completion
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				preset = "enter",
			},
			completion = {
				list = {
					selection = {
						preselect = true,
						auto_insert = true,
					},
				},

				documentation = {
					auto_show = true,
					-- border = "rounded",
					-- winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					-- max_width = 60,
					-- max_height = 20,
				},
			},
			sources = {
				default = { "lsp", "snippets", "path", "buffer" },
			},
		},
		config = function(_, opts)
			require("blink.cmp").setup(opts)
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
