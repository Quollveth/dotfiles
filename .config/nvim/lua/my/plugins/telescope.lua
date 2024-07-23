return {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                                    branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
                local builtin = require('telescope.builtin')                

                -- replaces default ff keybind to only look for git files, pf (project files) is standard search
                vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
                vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
        end
}
