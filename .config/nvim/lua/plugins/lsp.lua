return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp = require("cmp")

		-- moved things here for ease of editing

		-- setup configuration for each lsp
		-- not all require custom config, some should work ootb
		local HANDLERS = {
			-- default handler for every lsp without a custom one
			function(server_name)
				lspconfig[server_name].setup({})
			end,

			-- custom handlers
			lua_ls = function()
				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = { vim.env.VIMRUNTIME },
							},
						},
					},
				})
			end,

			-- typescript doesnt play nice with vue
			ts_ls = function()
				local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
				local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
				lspconfig["ts_ls"].setup({
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

			-- vue doesn't know where it lives
			volar = function()
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
		}

		-- keymaps for the completion selection
		local CMP_KEYMAPS = {
			-- confirm completion item
			["<CR>"] = cmp.mapping.confirm({ select = false }),

			-- scroll documentation window
			["<C-f>"] = cmp.mapping.scroll_docs(5),
			["<C-u>"] = cmp.mapping.scroll_docs(-5),

			-- toggle completion menu
			["<C-e>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.abort()
				else
					cmp.complete()
				end
			end),

			-- tab complete
			["<Tab>"] = cmp.mapping(function(fallback)
				local col = vim.fn.col(".") - 1

				if cmp.visible() then
					cmp.select_next_item({ behavior = "select" })
				elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
					fallback()
				else
					cmp.complete()
				end
			end, { "i", "s" }),

			-- go to previous item
			["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),

			-- navigate to next snippet placeholder
			["<C-d>"] = cmp.mapping(function(fallback)
				local luasnip = require("luasnip")

				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),

			-- navigate to the previous snippet placeholder
			["<C-b>"] = cmp.mapping(function(fallback)
				local luasnip = require("luasnip")

				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}

		-- keymaps for the lsp, used only after a lsp has attached to current buffer
		local ATTACH_KEYMAPS = function(event)
			local keymap = function(keys, func, desc, mode)
				mode = mode or "n"
				desc = desc or ""
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			keymap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
			keymap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "[d]efinition")
			keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "[D]eclaration")
			keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "[i]mplementation")
			keymap("gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "[t]ype definition")
			keymap("gr", "<cmd>lua vim.lsp.buf.references()<cr>", "[r]eference")
			keymap("gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "[s]ignature")
			keymap("ge", "<cmd>lua vim.diagnostic.open_float()<cr>", "[e]rrors")

			keymap("<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
			keymap("<F3>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		end

		--
		-- config copied from github.com/tonybanters/nvim below
		--

		-- Configure error/warnings interface
		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			float = {
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
			signs = {
				text = {
					-- requires nerdfont
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
		})

		-- Add cmp_nvim_lsp capabilities settings to lspconfig
		-- This should be executed before you configure any language server
		local lspconfig_defaults = lspconfig.util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		-- This is where you enable features that only work
		-- if there is a language server active in the file
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				ATTACH_KEYMAPS(event)
			end,
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"intelephense",
				"ts_ls",
				"eslint",
			},
			handlers = HANDLERS,
		})

		require("luasnip.loaders.from_vscode").lazy_load()

		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		cmp.setup({
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, item)
					local n = entry.source.name
					if n == "nvim_lsp" then
						item.menu = "[LSP]"
					else
						item.menu = string.format("[%s]", n)
					end
					return item
				end,
			},
			mapping = cmp.mapping.preset.insert(CMP_KEYMAPS),
		})
	end,
}
