local default_bg_color = nil

function ToggleTransparency()
	-- Get current Normal highlight group attributes
	local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
	local current_bg = normal_hl.bg

	if current_bg then
		-- Save the current background color if not already cached
		if not default_bg_color then
			default_bg_color = string.format("#%06x", current_bg)
		end

		-- Set transparency (remove background)
		vim.cmd("highlight Normal guibg=NONE")
		vim.cmd("highlight NonText guibg=NONE")
		vim.cmd("highlight LineNr guibg=NONE")
	else
		-- Restore the default background color
		if default_bg_color then
			vim.cmd(string.format("highlight Normal guibg=%s", default_bg_color))
			vim.cmd(string.format("highlight NonText guibg=%s", default_bg_color))
			vim.cmd(string.format("highlight LineNr guibg=%s", default_bg_color))
		else
			vim.cmd("highlight Normal guibg=#1e1e1e") -- Fallback color
		end
	end
end
-- TODO: fix this
vim.api.nvim_set_keymap("n", "<leader>tb", ":lua ToggleTransparency()<CR>", { noremap = true, silent = true })
