return {
  {
    'navarasu/onedark.nvim',
    version = 'v0.1.0',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'cool'
      })
      require('onedark').load()
    end
  }
}
