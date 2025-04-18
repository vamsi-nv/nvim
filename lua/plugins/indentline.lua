return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  config = function()
    require("ibl").setup({
      indent = { char = "│" },
      scope = { enabled = true },
      exclude = {
        filetypes = { "help", "dashboard", "terminal" },
        buftypes = { "terminal", "nofile" },
      },
      whitespace = { remove_blankline_trail = false },
    })
  end,
}