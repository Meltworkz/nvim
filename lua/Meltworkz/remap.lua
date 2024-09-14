
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d", "<C-d>zz")
vim.keymap.set("n", "<C-u", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Remap j to move up
-- vim.api.nvim_set_keymap('n', 'j', 'k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'j', 'k', { noremap = true, silent = true })

-- Remap k to move down
-- vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
