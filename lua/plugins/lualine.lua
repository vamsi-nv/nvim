return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for icons
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "auto", -- Change to your preferred theme
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "branch" }, -- Moved mode away from lualine_a
          lualine_b = { "diff" },
          lualine_c = { "filename", "diagnostics" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location", "mode" }, -- Mode moved to lualine_z
        },
      })
    end,
  }
  