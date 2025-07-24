return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>fe",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "[e]xplorer",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<C-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		vim.g.loaded_netrwPlugin = 1
	end,
}
