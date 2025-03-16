return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load during startup
  priority = 1000, -- Load before other UI plugins
  config = function()
    require("tokyonight").setup({
      style = "storm", -- Options: "storm", "night", "moon", "day"
      transparent = false, -- Set to true if you want a transparent background
      terminal_colors = true, -- Apply colors to Neovim terminal
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = { italic = true, bold = true },
        variables = {},
      },
    })

    -- Apply the theme
    vim.cmd("colorscheme tokyonight-night") -- Change to "tokyonight-storm", "tokyonight-moon", or "tokyonight-day" if preferred
  end,
}
