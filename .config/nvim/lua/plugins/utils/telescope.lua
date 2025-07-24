return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                                    branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = { -- Insert mode only
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
		-- replaces default ff keybind to only look for git files, pf (project files) is standard search
		-- so we dont get sixteen thousand results from node_modules that no one cares about
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[f]les" })
		vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "[f]iles" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[g]rep" })
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Search string" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "[F]ind [T]ODO" })

		-- extensions
		telescope.load_extension("fzf")
		telescope.load_extension("noice")
	end,
}
