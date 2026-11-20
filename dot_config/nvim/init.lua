local map = vim.keymap.set
local options = { noremap = true, silent = true }

map("i", "jj", "<Esc>", options)
map("n", "<D-s>", ":w<CR>", options)
map("i", "<D-s>", "<Esc>:w<CR>", options)


