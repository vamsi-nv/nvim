return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "javascript", "typescript", "python", "html", "css", "bash", "json"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        -- Optional: Enable rainbow brackets, autopairs, etc., with more plugins
      })
    end
}

