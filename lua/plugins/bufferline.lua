return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons support
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- Show buffers instead of tabs
          -- numbers = "ordinal", -- Show buffer numbers
          diagnostics = "nvim_lsp", -- Show LSP diagnostics on buffers
          separator_style = "thin", -- Cool separator style
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true
            }
          },
        }
      })
    end,
  }
  