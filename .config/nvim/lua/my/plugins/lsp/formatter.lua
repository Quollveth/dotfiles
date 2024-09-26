return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- gets passed to formatters_by_ft during config
		local formatters = {
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "isort", "black" }, -- python is special and gets two formatters
			cpp = { "clang_format" },
			c = { "clang_format" },
			go = { "gofumpt" },
			sh = { "beautysh" },
		}

		-- all file types used by prettier formatter, gets added to formatters object before config
		local prettier_fts = {
			"css",
			"flow",
			"graphql",
			"html",
			"json",
			"javascriptreact",
			"javascript",
			"less",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"vue",
			"solidity",
			"sveltejs",
		}

		for _, key in ipairs(prettier_fts) do
			formatters[key] = { "prettier" }
		end

		conform.setup({
			formatters_by_ft = formatters,
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format buffer" })
	end,
}
