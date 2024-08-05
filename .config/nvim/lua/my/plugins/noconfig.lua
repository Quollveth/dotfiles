-- Plugins that do not need a configuration
return {
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive" },
	{ "andweeb/presence.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "m4xshen/smartcolumn.nvim", opts = { colorcolumn = "120", disabled_filetypes = { "alpha" } } },
	{ "stevearc/dressing.nvim",   event = "VeryLazy" }
}
