return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Auto-update parsers on install
    event = { "BufReadPost", "BufNewFile" }, -- Load only when opening a file
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "typescript", "html", "css", "json", "bash", "python" }, -- Add more languages as needed
        highlight = {
          enable = true, -- Enable syntax highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true }, -- Enable automatic indentation
        autotag = { enable = true }, -- Enable automatic closing tags (with nvim-ts-autotag)
      })
    end,
  }
  