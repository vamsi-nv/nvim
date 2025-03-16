return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")
  
      toggleterm.setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl+\
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "float", -- Default: floating terminal
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
  
      -- Terminal objects for multiple terminals
      local Terminal = require("toggleterm.terminal").Terminal
  
      -- Floating terminal
      local float_term = Terminal:new({
        direction = "float",
      })
  
      -- Horizontal terminal
      local horizontal_term = Terminal:new({
        direction = "horizontal",
      })
  
      -- Vertical terminal
      local vertical_term = Terminal:new({
        direction = "vertical",
      })
  
      -- Custom Terminal: LazyGit
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })
  
      function _FLOAT_TERM_TOGGLE()
        float_term:toggle()
      end
  
      function _HORIZONTAL_TERM_TOGGLE()
        horizontal_term:toggle()
      end
  
      function _VERTICAL_TERM_TOGGLE()
        vertical_term:toggle()
      end
  
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
  
      -- Keybindings
      vim.keymap.set("n", "<leader>tf", _FLOAT_TERM_TOGGLE, { desc = "Toggle Floating Terminal" })
      vim.keymap.set("n", "<leader>th", _HORIZONTAL_TERM_TOGGLE, { desc = "Toggle Horizontal Terminal" })
      vim.keymap.set("n", "<leader>tv", _VERTICAL_TERM_TOGGLE, { desc = "Toggle Vertical Terminal" })
      vim.keymap.set("n", "<leader>tg", _LAZYGIT_TOGGLE, { desc = "Toggle LazyGit" })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
    end,
  }
  