-- Set leader key
vim.g.mapleader = " "  -- Spacebar as leader key

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap("n", "<leader>w", ":w<CR>", opts)         -- Save file
keymap("n", "<leader>q", ":q<CR>", opts)         -- Quit
keymap("n", "<leader>x", ":x<CR>", opts)         -- Save & quit
keymap("n", "<leader>nh", ":nohl<CR>", opts)     -- Clear search highlights

-- Window Splitting
keymap("n", "<leader>sv", ":vsplit<CR>", opts)   -- Split window vertically
keymap("n", "<leader>sh", ":split<CR>", opts)    -- Split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts)        -- Equalize window sizes
keymap("n", "<leader>sx", ":close<CR>", opts)    -- Close current split

-- Tab Management
keymap("n", "<leader>to", ":tabnew<CR>", opts)   -- Open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- Close current tab
keymap("n", "<leader>tn", ":tabnext<CR>", opts)  -- Next tab
keymap("n", "<leader>tp", ":tabprev<CR>", opts)  -- Previous tab

-- File Explorer (nvim-tree)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Toggle file explorer
keymap("n", "<leader>fe", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Focus NvimTree" })
keymap("n", "<leader>fc", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Find File in NvimTree" })


-- Move Between Windows
keymap("n", "<C-h>", "<C-w>h", opts)             -- Move to left window
keymap("n", "<C-l>", "<C-w>l", opts)             -- Move to right window
keymap("n", "<C-j>", "<C-w>j", opts)             -- Move to bottom window
keymap("n", "<C-k>", "<C-w>k", opts)             -- Move to top window

-- Resize Windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)    -- Increase height
keymap("n", "<C-Down>", ":resize -2<CR>", opts)  -- Decrease height
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Decrease width
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Increase width

keymap("i", ";;", "<ESC>", opts) 

vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true }) -- Close buffer
