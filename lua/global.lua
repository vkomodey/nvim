vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Required for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('vk-highlight-yank', { clear = trye }),
  callback = function()
    vim.hl.on_yank()
  end,
})

