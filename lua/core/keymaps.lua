local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>nh", ":nohl<CR>", opts) -- Clear search highlights

-- Window management
keymap("n", "<leader>wv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>wh", "<cmd>split<CR>", opts)
keymap("n", "<leader>wc", "<cmd>close<CR>", opts)
keymap("n", "<leader>wo", "<cmd>only<CR>", opts)

-- Move Between Windows
keymap("n", "<C-h>", "<C-w>h", opts) -- Move to left window
keymap("n", "<C-l>", "<C-w>l", opts) -- Move to right window
keymap("n", "<C-j>", "<C-w>j", opts) -- Move to bottom window
keymap("n", "<C-k>", "<C-w>k", opts) -- Move to top window

-- Resize Windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts) -- Increase height
keymap("n", "<C-Down>", ":resize -2<CR>", opts) -- Decrease height
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Decrease width
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Increase width
keymap("n", "<TAB>", ":bn<CR>", opts) -- Increase width
