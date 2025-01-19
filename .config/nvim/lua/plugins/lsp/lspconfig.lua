return {
	"neovim/nvim-lspconfig",
	-- Since mason isn't lazy loaded this ensures lspconfig is always loaded after it
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local blink_cmp = require("blink.cmp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(args)
				local c = vim.lsp.get_client_by_id(args.data.client_id)
				if not c then
					return
				end

				--TODO: this thing
			end,
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local capabilities = blink_cmp.get_lsp_capabilities()

		mason_lspconfig.setup_handlers({
			-- Default configuration for all servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- Specific configuration for specific servers

			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },
						},
					},
				})
			end,
			["tsserver"] = function()
				local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
				local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
				lspconfig["tsserver"].setup({
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = volar_path,
								languages = { "vue" },
							},
						},
					},
				})
			end,
			["volar"] = function()
				lspconfig["volar"].setup({
					init_options = {
						typescript = {
							tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
						},
						vue = {
							hybridMode = false,
						},
					},
				})
			end,
		})
	end,
}
