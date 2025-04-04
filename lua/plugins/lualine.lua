return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons support
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- Change to "tokyonight", "rose-pine", etc.
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- One statusline for all splits
      },
      sections = {
        -- Left side
        lualine_a = { { "mode", fmt = function(str) return str:sub(1,1) end } }, -- Shorten mode (I, N, V)
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- Show relative file path

        -- Right side
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },
    })
  end,
}
