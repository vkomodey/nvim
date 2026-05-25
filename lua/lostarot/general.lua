vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.o.number = true

vim.o.mouse = 'a'
vim.o.showmode = false
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.smartcase = true
vim.o.list = true

vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.api.nvim_create_autocmd('TextYankPost', {

  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true}),
  callback = function()
    vim.hl.on_yank()
  end
})

vim.o.autowriteall = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.opt.termguicolors = true

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter"}, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})
