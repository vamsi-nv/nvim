return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = { italic = true, bold = true },
        variables = {},
      },
    })
    vim.cmd("colorscheme tokyonight-storm")
  end,
}