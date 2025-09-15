return {
	{
		"olimorris/codecompanion.nvim",
		opts = {
			strategies = {
				chat = {
					adapter = "copilot",
					model = "gpt-4.1",
				},
				inline = {
					adapter = "copilot",
					model = "gpt-4.1",
				},
				cmd = {
					adapter = "copilot",
					model = "gpt-4.1",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},
	-- GitHub Copilot
	-- To Authenticate:
	-- 1. Open Neovim in Windows and run :Copilot setup
	-- 2. Copy the `app.json` from %APPDATA%/Local/github-copilot
	-- 3. Paste the `app.json` into ~/.config/github-copilot/
	-- (https://github.com/orgs/community/discussions/50263#discussioncomment-13079418)
	{
		"github/copilot.vim",
	},
}
