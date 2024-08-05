vim.g.mapleader = " "
vim.g.maplocalleader = " "


local map = vim.keymap.set


map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

map("n", "J", "mzJ`z")       -- Keep cursor in place when appending next line

map("n", "<C-d>", "<C-d>zz") -- Keep cursor in place when using half page jump
map("n", "<C-u>", "<C-u>zz") -- Keep cursor in place when using half page jump

map("x", "<leader>p", "\"_dp", { desc = "Paste preserving copy buffer" })
map({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete preserving copy buffer" })

map({ "n", "v" }, "<leader>y", "\"+y", { desc = "Copy into system clipboard" })

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current .sh file executable" })

map("n", "<leader>w", ":set wrap!<CR>", { noremap = true, silent = true, desc = "Toggle line wrap" })

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })


-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
map("n", "<leader>so", "<cmd>only<CR>", { desc = "Close all but current split" })


-- Bufferline
map("n", "<S-b>", "<cmd> enew <CR>")                --"new buffer"
map("n", "<A-.>", "<cmd> BufferLineCycleNext <CR>") --"next buffer"
map("n", "<A-,>", "<cmd> BufferLineCyclePrev <CR>") --"prev buffer"
map("n", "<A-f>", "<cmd> BufferLinePick <CR>")
map("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>")    --"close buffer"
