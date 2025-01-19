-- Plugins that do not need a configuration
return {
	{ "nvim-neotest/nvim-nio" }, -- dependency for something i forgot what
	{ "nvim-lua/plenary.nvim" }, -- dependency for something i forgot what
	{ "knubie/vim-kitty-navigator" }, -- meow
	{ "tpope/vim-fugitive" }, -- git
	{ "andweeb/presence.nvim" }, -- discord presence
	{ "hrsh7th/cmp-cmdline" }, -- autocompletion for the commandline
	{ "m4xshen/smartcolumn.nvim", opts = { colorcolumn = "120", disabled_filetypes = { "alpha" } } }, -- only show the column when we reach it
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- makes telescope look more nicer
	{ "gpanders/nvim-parinfer" }, -- balances parenthesis
	{ "elkowar/yuck.vim" }, -- for eww widgets
	{ "nvim-treesitter/nvim-treesitter-context" }, -- shows current scope at the top of screen
	{ "hiphish/rainbow-delimiters.nvim" }, -- colorful parenthesis if i ever decide to open a lisp file
}
