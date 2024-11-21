vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Terminal Commands
vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move focus to the right window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move focus to the lower window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move focus to the upper window" })
