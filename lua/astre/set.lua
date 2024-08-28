vim.opt.nu = true
vim.opt.guicursor = ""

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.opt.undofile = true
vim.lsp.set_log_level("off")

if vim.g.neovide then
    vim.api.nvim_set_keymap('t', '<D-v>', '<C-\\><C-o>"+p', { noremap = true, silent = true })
end
