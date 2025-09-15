return {
	"nvim-mini/mini.nvim",
	version = "*", -- Stable
	config = function()
		-- [[ General ]]
		require("mini.basics").setup({
			options = {
				extra_ui = true,
			},

			mappings = {
				windows = true,
			},
		})

		require("mini.bracketed").setup()

		require("mini.clue").setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- Bracketed commands
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				require("mini.clue").gen_clues.builtin_completion(),
				require("mini.clue").gen_clues.g(),
				require("mini.clue").gen_clues.marks(),
				require("mini.clue").gen_clues.registers(),
				require("mini.clue").gen_clues.windows(),
				require("mini.clue").gen_clues.z(),

				-- Custom
				{ mode = "n", keys = "<leader>s", desc = "Search" },
				{ mode = "n", keys = "<leader>c", desc = "AI" },
			},

			window = {
				delay = 1,
			},
		})

		require("mini.diff").setup({
			source = require("mini.diff").gen_source.none(),
		})

		require("mini.extra").setup()

		require("mini.files").setup({
			windows = {
				preview = true,
			},
		})

		require("mini.git").setup()
		require("mini.jump").setup()

		require("mini.jump2d").setup()

		require("mini.pick").setup()
		require("mini.sessions").setup()
		require("mini.visits").setup()
		require("mini.fuzzy").setup()

		-- [[ Text Editing ]]
		require("mini.ai").setup()
		require("mini.keymap").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.snippets").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()

		-- [[ Appearance ]]
		require("mini.hipatterns").setup()
		require("mini.statusline").setup()
		require("mini.tabline").setup()
		require("mini.icons").setup()
		require("mini.starter").setup()
		require("mini.cursorword").setup()

		require("mini.indentscope").setup({
			symbol = "|",
			options = {
				try_as_border = true,
			},
		})
	end,
}
