-- General Settings
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true       -- Relative line numbers
vim.opt.wrap = false                -- Disable line wrapping
vim.opt.cursorline = true           -- Highlight the current line
vim.opt.signcolumn = "yes"          -- Always show the sign column

-- Tabs & Indentation
vim.opt.tabstop = 2                 -- Number of spaces a tab represents
vim.opt.shiftwidth = 2              -- Number of spaces for indentation
vim.opt.expandtab = true            -- Convert tabs to spaces
vim.opt.autoindent = true           -- Copy indent from the previous line

-- Search Settings
vim.opt.ignorecase = true           -- Ignore case in search patterns
vim.opt.smartcase = true            -- Case-sensitive search if uppercase letters are used
vim.opt.incsearch = true            -- Show search matches while typing

-- Splitting Windows
vim.opt.splitbelow = true           -- New horizontal split opens below
vim.opt.splitright = true           -- New vertical split opens to the right

-- Clipboard
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard

-- Other
vim.opt.termguicolors = true        -- Enable true colors
vim.opt.scrolloff = 8               -- Keep 8 lines above/below cursor
vim.opt.updatetime = 300            -- Faster update time for plugins
