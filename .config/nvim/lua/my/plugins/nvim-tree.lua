return {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
                "nvim-tree/nvim-web-devicons"
        },
        config = function()
                local nvimtree = require("nvim-tree")

--                vim.g.loaded_netrw = 1
--                vim.g.loaded_netewPlugin = 1

                nvimtree.setup({
                        view = {
                                width = 60,
                        },
                })

                vim.keymap.set("n","<leader>ee","<cmd>NvimTreeToggle<CR>")
                vim.keymap.set("n","<leader>ec","<cmd>NvimTreeCollapse<CR>")
                vim.keymap.set("n","<leader>er","<cmd>NvimTreeRefresh(CR)>")
        end
}
