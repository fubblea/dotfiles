return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      size = 20,
      direction = "horizontal",
    })
  end,
}