return {
        "rmagatti/auto-session",
        config = function()
                local session = require("auto-session")

                session.setup({
                        auto_restore_enabled = false,
                        auto_session_supress_dirs = {"~/","~/Workspaces/","~/Documents","~/Downloads","~/dotfiles"},
                })

                vim.keymap.set("n","<leader>wr","<cmd>SessionRestore<CR>",{desc="Restore session for cwd"})
                vim.keymap.set("n","<leader>ws","<cmd>SessionSave<CR>",{desc="Save session for root dir"})

        end,
}
