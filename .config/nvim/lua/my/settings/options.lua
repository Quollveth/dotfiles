vim.opt.nu = true
vim.opt.relativenumber = true
-- 8 is alredy the default but lets specify anyways
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Undotree handles history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/.vim/undodir"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "160"
