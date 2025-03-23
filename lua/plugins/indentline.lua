return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        indent = { char = "│" }, -- Change character if needed
        scope = { enabled = true }, -- Highlight current indent scope
        exclude = {
          filetypes = { "help", "dashboard", "NvimTree", "terminal" },
          buftypes = { "terminal", "nofile" },
        },
        whitespace = {
          remove_blankline_trail = false, -- Prevent breaking on blank lines
        },
      })
    end,
  }
  