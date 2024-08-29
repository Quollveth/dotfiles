return {
	"adalessa/laravel.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"tpope/vim-dotenv",
		"MunifTanjim/nui.nvim",
		"nvimtools/none-ls.nvim",
	},
	cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
	keys = {
		{ "<leader>la", ":Laravel artisan<cr>" },
		{ "<leader>lr", ":Laravel routes<cr>" },
		{ "<leader>lm", ":Laravel related<cr>" },
	},
	events = { "VeryLazy" },
	opts = {
		features = {
			null_ls = {
				enable = true,
			},
			route_info = {
				enable = true,
				position = "right",
				middlewares = true,
				method = true,
				uri = true,
			},
		},
	},
	config = true,
}
