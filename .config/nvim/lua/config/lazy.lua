-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" }, -- only here to pull noconfig.lua
	{ import = "plugins.ui" }, -- ui changes
	{ import = "plugins.colors" }, -- the most important one
	{ import = "plugins.utils" }, -- misc utility plugins
	{ import = "plugins.lsp" }, -- lspconfig, mason and related
	{ import = "plugins.debugger" }, -- theres only one file in there lol
	{ import = "plugins.languages" }, -- plugins for specific languages
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
