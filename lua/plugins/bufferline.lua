return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons support
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "📁 File Explorer",
            highlight = "Directory",
            separator = true
          }
        },
        padding = {
          left = 2,
          right = 2,
        },
        tab_size = 20, -- Make tabs wider
      },
      highlights = {
        fill = { bg = "#1e1e1e" }, -- Background color
        buffer_selected = { bold = true, italic = false },
        separator = { fg = "#1e1e1e", bg = "#1e1e1e" },
        separator_selected = { fg = "#1e1e1e", bg = "#1e1e1e" },
        tab_selected = { gui = "bold", sp = "#ffffff" },
      },
    })

    -- Increase Font Size (Requires a GUI Neovim like Neovide, Alacritty, etc.)
    vim.opt.guifont = "JetBrainsMono Nerd Font:h14" -- Increase font size
  end,
}
