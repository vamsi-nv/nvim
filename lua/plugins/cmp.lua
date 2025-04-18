return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",             -- Snippet engine
    "saadparwaiz1/cmp_luasnip",     -- Snippet completions
    "hrsh7th/cmp-nvim-lsp",         -- LSP completion
    "hrsh7th/cmp-buffer",           -- Buffer completion
    "hrsh7th/cmp-path",             -- Path completion
    "hrsh7th/cmp-cmdline",          -- Command-line completion
    "windwp/nvim-autopairs",        -- Autopairs integration
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })

    -- Autopairs integration
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}