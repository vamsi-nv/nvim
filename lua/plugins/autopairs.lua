return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Load when entering insert mode
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Enable Treesitter integration
        fast_wrap = {}, -- Enable fast wrap
      })
    end,
  }
  