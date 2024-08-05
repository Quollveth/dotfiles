return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "→",
					package_uninstalled = "✗"
				}
			}
		})

		mason_lsp.setup({
			ensure_installed = {
				-- Only basics here, manually install as needed
				"lua_ls",
				"marksman",
			},
		})
	end
}
