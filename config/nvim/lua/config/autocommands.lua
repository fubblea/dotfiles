-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Tabstop override
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "json", "yaml", "html", "css" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Disable confirmation and run async formatting
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>f", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					-- If you only want to use a specific client for formatting:
					-- return client.name == "null-ls"
					return true
				end,
			})
		end, "Format buffer")
	end,
})

-- Toggle term
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Kill all running terminals on :wqa, :qa, :qall, etc.
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		-- Loop over all buffers
		for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(bufnr) then
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
				if buftype == "terminal" then
					-- Force delete the buffer, killing the job
					vim.api.nvim_buf_delete(bufnr, { force = true })
				end
			end
		end
	end,
})
