vim.opt.nu = true
vim.opt.relativenumber = true

local tabWidth = 4

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.tabstop = tabWidth
vim.opt.softtabstop = tabWidth
vim.opt.shiftwidth = tabWidth
vim.opt.expandtab = false

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Undotree handles history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/.vim/undodir"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.inccommand = "split"
-- Better search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Don't have 'o' add a comment
vim.opt.formatoptions:remove("o")

-- Set window title to CWD
vim.opt.title = true
vim.opt.titlestring = [[%t – %{fnamemodify(getcwd(), ':t')}]]
