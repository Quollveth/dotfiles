return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		--                vim.g.loaded_netrw = 1
		--                vim.g.loaded_netewPlugin = 1

		nvimtree.setup({
			view = {
				width = 30,
			},
		})
		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFocus<CR>")
		vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "[T]ree [C]ollapse" })
		vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", { desc = "[T]ree [R]efresh" })
	end,
}
