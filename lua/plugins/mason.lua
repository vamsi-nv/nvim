return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Integrates Mason with nvim-lspconfig
    "neovim/nvim-lspconfig",             -- Core LSP configurations
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "👍 ",
          package_pending = "->",
          package_uninstalled = "X  "
        },
      },
      install_root_dir = vim.fn.stdpath("data") .. "\\mason",
    })

    require("mason-lspconfig").setup({
      ensure_installed = { -- Automatically install these LSP servers
        "lua_ls",        -- Lua
        "ts_ls",
        "eslint",        -- ESLint
        "pyright",
        -- "html",          -- HTML
        -- "cssls",         -- CSS
        -- "jsonls",        -- JSON
      },
      automatic_installation = true, -- Auto-install missing servers
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup LSP servers
    local servers = { "lua_ls", "ts_ls","pyright" }
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
  end,
}
