vim.opt.nu = true
vim.opt.relativenumber = true

local tabWidth = 4

vim.opt.tabstop = tabWidth
vim.opt.softtabstop = tabWidth
vim.opt.shiftwidth = tabWidth
vim.opt.expandtab = false

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

-- Set window title to CWD
vim.opt.title = true
vim.opt.titlestring = [[%t – %{fnamemodify(getcwd(), ':t')}]]

-- Show whitespace
vim.opt.list = true
local space = "·"
vim.opt.listchars:append({
	tab = "▏ ",
	lead = space,
	trail = space,
	nbsp = space,
})
