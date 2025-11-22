vim.o.number      = true
vim.o.mouse       = 'a'
-- do not show the mode
vim.o.showmode    = false
vim.o.breakindent = true
-- save undo history
vim.o.undofile    = true
-- case insensitive search unless there is a capital letter in the /
vim.o.ignorecase = true
vim.o.smartcase = true
-- new splits configuration
vim.o.splitright = true
vim.o.splitbelow = true
-- :h 'list'
vim.o.list = true
-- Preview substitutions live as you type %s
vim.o.inccommand = 'split'
-- Show which line you are
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 15
-- :h 'confirm'
vim.o.confirm = true


--Write the contents of the file, if it has been modified, on each
--`:next`, `:rewind`, `:last`, `:first`, `:previous`, `:stop`,
--`:suspend`, `:tag`, `:!`, `:make`, CTRL-] and CTRL-^ command; and when
--a `:buffer`, CTRL-O, CTRL-I, '{A-Z0-9}, or `{A-Z0-9} command takes one
--to another file.`'tabs and stuff
vim.o.autowriteall = true

-- share the clipboard between OS and nvim
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- tabs and stuff
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

--enable 24-bit colour
vim.opt.termguicolors = true
