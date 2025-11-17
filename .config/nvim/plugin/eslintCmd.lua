vim.api.nvim_set_keymap(
  "n",
  "<leader>fF",
  ":!npx eslint --fix %<CR>",
  { noremap = true, silent = true, desc = "ESLint fix current file" }
)
