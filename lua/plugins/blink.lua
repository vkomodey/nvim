return {{
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim'
  },
  version = '1.*',

  opts = {
    keymap = { 
      preset = 'super-tab',
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
    },
    appearence = {
      nerd_font_variant = 'mono',
      use_nvim_cmp_as_default = false,
    },
    completion = {
      documentation = { auto_show = true },
      menu = { border = "single" },
      documentation = { window = { border = "single" } }
    },
    signature = { enabled=true, window = { border = "single" } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        "exact",
        "score",
        "sort_text",
      }
    }
  },
  opts_extend = { "sources.default" }
}}
