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
vim.keymap.set("n", "<leader>e", function()
	MiniFiles.open()
end, { desc = "Files Explorer" })

-- Search
vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>", { desc = "Search Grep" })
vim.keymap.set("n", "<leader>sc", "<cmd>Pick commands<cr>", { desc = "Search Commands" })
vim.keymap.set("n", "<leader>sv", "<cmd>Pick visit_paths<cr>", { desc = "Search Visits" })
vim.keymap.set("n", "<leader>sh", "<cmd>Pick hipatterns<cr>", { desc = "Search Hipatterns" })
vim.keymap.set("n", "<leader>sb", "<cmd>Pick buffers<cr>", { desc = "Search Buffers" })
-- Keymap to pick document symbols (functions, classes, etc.) in current buffer
vim.keymap.set("n", "<leader>ss", function()
	require("mini.extra").pickers.lsp({ scope = "document_symbol" }, {
		-- optional: customizations

		-- `source name` shows in the picker UI, helps identify scope
		source = { name = "Document Symbols" },

		-- Optional: choose what to do when you select a symbol
		-- e.g., jump to its location
		-- The `on_choice` arg is passed to the picker; depends on picker implementation
		-- For MiniExtra.lsp, I believe `choose = function(item) ... end` can be passed
	})
end, { desc = "Document Symbols Picker", silent = true })

-- Keymap to pick workspace symbols
vim.keymap.set("n", "<leader>sS", function()
	require("mini.extra").pickers.lsp({ scope = "workspace_symbol" }, {
		source = { name = "Workspace Symbols" },
	})
end, { desc = "Workspace Symbols Picker", silent = true })

-- Aerial
vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial Next" })
vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial Previous" })

-- Neogen
vim.keymap.set("n", "<leader>d", "<cmd>Neogen<CR>", { desc = "Neogen" })

-- Code Completion
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "Chat" })
vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionActions<CR>", { desc = "Actions" })
vim.keymap.set("n", "<leader>ci", function()
	-- Prompt user for input
	local prompt = vim.fn.input("CodeCompanion prompt: ")
	if prompt ~= "" then
		vim.cmd("CodeCompanion " .. prompt)
	end
end, { desc = "Inline chat" })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Chat Add" })

