vim.opt.nu = true
vim.opt.guicursor = ""

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 16
vim.opt.shiftwidth = 8
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.opt.undofile = true
vim.lsp.set_log_level("off")
