return {
    "folke/which-key.nvim",
    config = function()
      local wk_status, wk = pcall(require, "which-key")
      if not wk_status then
        return
      end
  
      wk.setup({
        window = {
          border = "rounded",
          position = "bottom",
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
        },
      })
  
      -- Register keymaps
      wk.register({
        ["<leader>f"] = { name = "File" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>l"] = { name = "LSP" },
      }, { prefix = "<leader>" })
    end,
  }
  