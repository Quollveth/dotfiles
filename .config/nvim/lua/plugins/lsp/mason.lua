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
				"lua_ls", -- Lua
				"marksman", -- Markdown
				"clangd", -- C/C++
				"gopls", -- Go
				"ts_ls", -- JS/TS
				"volar", -- Vue
				"bashls", -- Bash
				"dockerls", -- Dockerfile
			},
		})

		mason_installer.setup({
			ensure_installed = {
				---- Formatters and linters
				"prettier", -- A bunch
				"stylua", -- Lua formatter
				"luacheck", -- Lua linter
				"clang-format", -- C/C++
				"isort", -- Python formatter
				"markdownlint", -- Also a formatter
				"beautysh", -- Bash
			},
		})
	end,
}
