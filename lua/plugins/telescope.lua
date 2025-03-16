return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency
      "nvim-telescope/telescope-fzf-native.nvim", -- Faster sorting (optional)
      build = "make", -- Required for fzf-native
    },
    config = function()
      local telescope = require("telescope")
  
      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      })
  
      -- Load extensions
      pcall(telescope.load_extension, "fzf")
  
      -- Keybindings
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    end,
  }
  