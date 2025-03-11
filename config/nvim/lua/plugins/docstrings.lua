return {
  "danymat/neogen",
  config = true,
  version = "*",

  init = function()
    local opts = { noremap = true, silent = true, desc = "Generate docstring" }
    vim.api.nvim_set_keymap("n", "<Leader>cD", ":lua require('neogen').generate()<CR>", opts)

    require("neogen").setup({
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc", -- for a full list of annotation_conventions, see supported-languages below,
          },
        },
      },
    })
  end,
}
