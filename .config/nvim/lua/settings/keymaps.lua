vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Move lines in visual mode
map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Keep cursor in place when appending next line
map("n", "J", "mzJ`z")

-- Keep cursor in place when using half page jump
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- By default deleting a line or pasting over it overwrites your current copy buffer
map("x", "<leader>p", '"_dp', { desc = "Paste preserving" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete preserving" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank into system clipboard" })

map("n", "<leader><C-x>", "<cmd>!chmod +x %<CR>", { silent = true, desc = "chmod +x buffer" })

map("n", "<leader>w", ":set wrap!<CR>", { noremap = true, silent = true, desc = "[W]rap lines" })
map("n", "<leader>nh", ":nohl<CR>", { desc = "[N]o [H]ighlights" })

-- Change the number under cursor
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Place new lines in normal mode without entering insert mode
map("n", "o", "o<Esc>", { noremap = true, silent = true })
map("n", "O", "O<Esc>", { noremap = true, silent = true })

-- Copy line above or below
vim.api.nvim_set_keymap("n", "Yk", "kyypj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Yj", "jyypk", { noremap = true, silent = true })

-- Source current file
vim.api.nvim_set_keymap(
	"n",
	"<leader>so",
	":luafile %<CR>",
	{ noremap = true, silent = true, desc = "[S][O]urce lua file" }
)

-- Better split navigation
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-h>", "<c-w><c-h>")

-- Resize splits
map("n", "<M-C-,>", "<c-w>5<")
map("n", "<M-C-.>", "<c-w>5>")
map("n", "<M-C-t>", "<c-w>+")
map("n", "<M-C-s>", "<c-w>-")
