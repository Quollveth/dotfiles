-- Plugins that don't need a lot of configuration
return {
	{ -- dependency for something i forgot what
		"nvim-neotest/nvim-nio",
	},
	{ -- dependency for something i forgot what
		"nvim-lua/plenary.nvim",
	},
	{ -- git
		"tpope/vim-fugitive",
	},
	{ -- discord presence
		"andweeb/presence.nvim",
	},
	{ -- autocompletion for the commandline
		"hrsh7th/cmp-cmdline",
	},
	{ -- only show the column when we reach it
		"m4xshen/smartcolumn.nvim",
		opts = {
			colorcolumn = "120",
			disabled_filetypes = { "alpha" },
		},
	},
	{ -- makes telescope look more nicer
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{ -- balances parenthesis
		"gpanders/nvim-parinfer",
	},
	{ -- for eww widgets
		"elkowar/yuck.vim",
	},
	{ -- shows current scope at the top of screen
		"nvim-treesitter/nvim-treesitter-context",
	},
	{ -- colorful parenthesis if i ever decide to open a lisp file
		"hiphish/rainbow-delimiters.nvim",
	},
	{ -- Show CSS Colors
		"norcalli/nvim-colorizer.lua",
	},
	{ -- Dim everything but immediate area
		"folke/twilight.nvim",
		config = function()
			vim.keymap.set("n","<leader>T","<cmd>Twilight<CR>",{desc = "[T]wilight"})
		end
	},
	{ -- Limits relative line numbers to 5
		"mluders/comfy-line-numbers.nvim",
	},
}
