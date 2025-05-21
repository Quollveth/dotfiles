return {}
--[[
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "iceberg_dark", ----------------	  HERE
				component_separators = { left = "|", right = "|" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp" },
						sections = { "error", "warn" },
						symbols = { error = " ", warn = " " },
					},
				},
				lualine_c = { {
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1,
				} },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "encoding", "filetype" },
				lualine_z = {},
			},
		})
	end,
}
--]]
