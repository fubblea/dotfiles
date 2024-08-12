return {
  "olimorris/persisted.nvim",
  lazy = false, -- make sure the plugin is always loaded at startup
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
  },
  config = function()
    require("persisted").setup({
      git_use_branch = true,
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionLoad<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}
