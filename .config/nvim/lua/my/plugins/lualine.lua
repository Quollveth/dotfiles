return {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
                local lualine = require("lualine")
                local lazy_status = require("lazy.status")

                lualine.setup({
                        options = {
                                icons_enabled = true,
                                theme = 'auto',
                                component_separators = { left = '', right = ''},
                                section_separators = { left = '', right = ''},
                        },
                        sections = {
                                lualine_a = {'mode'},
                                lualine_b = {'branch', 'diff', 'diagnostics'},
                                lualine_c = {'filename'},
                                lualine_x =  {
                                        {
                                        lazy_status.updates,
                                        cond = lazy_status.has_updates,
                                        color = {fg = "#ff9e64"}
                                        }
                                },
                                lualine_y = {"encoding","filetype"},
                                lualine_z = {}
                        },
               })
        end
}
