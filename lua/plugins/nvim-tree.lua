local function tree_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return {desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'H', api.tree.collapse_all, opts('Collapse all'))
  vim.keymap.set('n', 'x', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<BS>', api.fs.cut, opts('Cut the file'))
end

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

local git_add = function()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()
  local gs = node.git_status.file

  -- if the current node is a dir get children status
  if gs == nil then
    s = (node.git_status.dir ~= nil and node.git_status.dir.direct[1])
      or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
  end

  -- if the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  api.tree.reload()
end

vim.api.nvim_create_autocmd({"VimEnter"}, { callback = open_nvim_tree })
vim.keymap.set('n', '<C-d>', ':NvimTreeToggle<C-m>', {desc="Toggle nvim tree"})
vim.keymap.set('n', 'ga', git_add, {desc="Git add"})

return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive"
        },
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true
        },
        filters = {
          dotfiles = false,
          git_ignored=false,
        },
        system_open = {
          cmd = "dolphin",
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true
        },
        git = {
          timeout = 800,
        },
        update_focused_file = { enable = true },
        on_attach=tree_attach
      })
    end
  }
}
