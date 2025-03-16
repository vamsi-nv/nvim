return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup for TypeScript/JavaScript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    -- Setup for Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }, -- Fix "vim is undefined" error
        },
      },
    })
  end,
}
