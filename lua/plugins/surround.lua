return {
  {
    "nvim-mini/mini.surround",
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = '<leader>za',
          delete = '<leader>zd',
          find = '<leader>cf',
          find_left = '<leader>cF',
          highlight = '<leader>ch',
          replace = '<leader>zr',
        }
      })
    end
  }
}
