if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.9
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
