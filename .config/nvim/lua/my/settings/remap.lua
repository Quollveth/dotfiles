vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open explorer, stays here even tho i have nvim-tree for sm reason
vim.keymap.set("n", "<leader>ep", vim.cmd.Ex)

-- Move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Keep cursor in place when appending next line
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in place when using half page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over selection while maintaining copy buffer
vim.keymap.set("x", "<leader>p", "\"_dp")
-- Same thing but deleting
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Copy into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Make current shell script executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true })
