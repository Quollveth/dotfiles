return {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
               require("catppuccin").setup({
                       flavour = "mocha",
                       transparent_background = true,
                       show_end_of_buffer = true,
               })
        end
}
