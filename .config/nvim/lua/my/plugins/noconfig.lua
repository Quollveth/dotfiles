-- Plugins that do not need a configuration
return {
	{ "nvim-neotest/nvim-nio" }, -- dependency for something i forgot what
	{ "knubie/vim-kitty-navigator" }, -- meow
	{ "nvim-lua/plenary.nvim" }, -- dependency for something i forgot what
	{ "tpope/vim-fugitive" }, -- git
	{ "andweeb/presence.nvim" }, -- discord presence
	{ "hrsh7th/cmp-cmdline" }, -- autocompletion for the commandline
	{ "m4xshen/smartcolumn.nvim", opts = { colorcolumn = "120", disabled_filetypes = { "alpha" } } }, -- only show the column when we reach it
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- makes telescope look more nicer
}
