return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help"
  },
  config = function()

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
        confirmation = { completeopt = "menu,menuone,noinsert" }
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
      })
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = false }) },
        ["<C-j>"] = { c = cmp.mapping.select_next_item() },
        ["<C-k>"] = { c = cmp.mapping.select_prev_item() },
      }),
      sources = cmp.config.sources({name = "path"}, {name="cmdline"})
    })

    cmp.setup.cmdline({"/", "?"}, {
      mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = false }) },
        ["<C-j>"] = { c = cmp.mapping.select_next_item() },
        ["<C-k>"] = { c = cmp.mapping.select_prev_item() },
      }),
      sources = { {name="buffer"} }
    })
  end
}
