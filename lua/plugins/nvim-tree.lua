return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "right", -- Move NvimTree to the right
        width = 35, -- Adjust width as needed
      },
    })
  end,
}
