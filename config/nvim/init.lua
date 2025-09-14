-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Import Options
require("config.options")

-- Import Keymaps
require("config.keymaps")

-- Import Autocommands
require("config.autocommands")

-- Import lazy
require("config.lazy")
