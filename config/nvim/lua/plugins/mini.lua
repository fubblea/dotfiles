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
				{ mode = "n", keys = "<leader>c", desc = "CodeCompanion" },
				{ mode = "n", keys = "<leader>x", desc = "Trouble" },
				{ mode = "n", keys = "<leader>h", desc = "Git Hunk" },
				{ mode = "n", keys = "<leader>t", desc = "Toggle" },
			},

			window = {
				delay = 1,
			},
		})

		require("mini.extra").setup()

		require("mini.files").setup({
			windows = {
				preview = true,
			},
		})

		require("mini.jump").setup()

		require("mini.jump2d").setup()

		require("mini.pick").setup()

		vim.ui.select = function(items, opts, on_choice)
			require("mini.pick").start({
				source = {
					items = items,
					name = opts.prompt or "Select item",
					show = function(item)
						return tostring(item)
					end,
				},
				choose = function(item)
					on_choice(item, nil)
				end,
			})
		end
		vim.keymap.set("n", "<leader>st", "<cmd>TermSelect<CR>", { desc = "Search Terminal" })

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
		require("mini.hipatterns").setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})

		require("mini.statusline").setup()
		require("mini.tabline").setup()
		require("mini.icons").setup()
		require("mini.starter").setup()
		require("mini.cursorword").setup()
	end,
}
