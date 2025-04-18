require("core.options")
require("core.keymaps")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Set PowerShell as default shell on Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = "powershell"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


require("lazy").setup({
  import = "plugins"
})


local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show symbol + text (e.g. ƒ Function)
      maxwidth = 40,
      ellipsis_char = "...",
      menu = {
        -- buffer = "[BUF]",
        -- nvim_lsp = "[LSP]",
        -- luasnip = "[SNIP]",
        -- path = "[PATH]",
      },
    }),
  },
  -- optional: specify sources
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})
