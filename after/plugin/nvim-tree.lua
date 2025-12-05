local function open_nvim_tree()
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({"VimEnter"}, { callback = open_nvim_tree })
vim.keymap.set('n', '<C-d>', "<cmd>NvimTreeToggle<CR>", {})
