return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-\>]],
			shade_terminals = true,
			direction = "horizontal", -- can be "horizontal" or "vertical"
		})
	end,
}
