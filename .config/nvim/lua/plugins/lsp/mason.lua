return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")
		local mason_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "→",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lsp.setup({
			ensure_installed = {
				-- Only basics here, manually install as needed
				"lua_ls",
				"marksman",
			},
		})

		mason_installer.setup({
			ensure_installed = {
				---- Formatters
				"prettier", -- The one and only
				"stylua", -- Lua formatter
				"isort", -- Python formatter
				"black", -- Python is special so it gets two formatters

				---- Linters
				"luacheck", -- Lua linter
			},
		})
	end,
}
