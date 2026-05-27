local telescope_ignore_patterns = {
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "[^a-z]stub[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
  "Stub[^a-z]",
  "-lock.json"
}

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.load_extension('live_grep_args')
      local builtin = require('telescope.builtin')
      vim.keymap.set("n", "<leader>uI", function()
        vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled

        require("telescope.config").set_defaults({
          file_ignore_patterns = vim.g.telescope_ignore_enabled and telescope_ignore_patterns or {}
        })
        print("Telesecope ignore enabled=", vim.g.telescope_ignore_enabled)
      end, {noremap=true, desc = "Toggle telescope ignore patterns"})

      vim.keymap.set('n', '<C-p>', builtin.find_files, {desc="Telescope find files"})
      vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git changed files" })
      vim.keymap.set('n', '<leader>a', telescope.extensions.live_grep_args.live_grep_args, { noremap=true })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Registers' })
      vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Jumplist' })
      vim.keymap.set('n', '<leader>fl', function()
        builtin.resume()
      end, {noremap=true, silent=true, desc="Resume last Telescope picker"})
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous
            }
          }
        }
      })
    end
  }
}
