return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local todo = require("todo-comments")

		vim.keymap.set("n", "]t", function() todo.jump_next() end, { desc = "Next TODO comment" })
		vim.keymap.set("n", "[t", function() todo.jump_prev() end, { desc = "Prev TODO commend" })

		todo.setup()
	end
}
