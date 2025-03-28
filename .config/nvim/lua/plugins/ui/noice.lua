return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = {
						skip = true,
					},
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},

			vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "[N]oice [D]ismiss" }),
			vim.keymap.set("n", "<leader>nl", "<cmd>NoiceLast<CR>", { desc = "[N]oice [L]ast" }),
		})
	end,
}
