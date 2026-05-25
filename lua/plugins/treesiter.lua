return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch="main",
    lazy=false,
    build=":TSUpdate",
    event = {"BufReadPre", "BufNewFile"},
    config = function() 
      local treesitter = require("nvim-treesitter.config")
      require("nvim-treesitter.install").prefer_git = true

      treesitter.setup({
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        },
        ensure_installed = {
          "c",
          "vimdoc",
          "json",
          "terraform",
          "toml",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "regex"
        },
        
      })

      require("nvim-treesitter").setup({
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<A-o>",
              node_incremental = "<A-o>",
              node_decremental = "<A-i>",
              scope_incremental = "<A-O",
            }
          }
      })
    end
  }
}
