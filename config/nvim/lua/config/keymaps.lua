-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Plugin Keymaps ]]
vim.keymap.set("n", "<leader>f", function()
	MiniFiles.open()
end, { desc = "Open Files" })

-- Search
vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>", { desc = "Search Grep" })
vim.keymap.set("n", "<leader>sc", "<cmd>Pick commands<cr>", { desc = "Search Commands" })
vim.keymap.set("n", "<leader>sv", "<cmd>Pick visit_paths<cr>", { desc = "Search Visits" })
