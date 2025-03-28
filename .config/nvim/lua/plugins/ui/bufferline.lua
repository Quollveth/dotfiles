return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end,
				custom_filter = function(buf_number, buf_numbers)
					if vim.bo[buf_number].buftype ~= "terminal" then
						return true
					end
					return false
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "Filetree",
						text_align = "center",
						separator = true,
					},
				},
			},
		})
	end,
}
