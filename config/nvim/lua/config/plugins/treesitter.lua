return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "python", "rust" },
          sync_install = false,
	  auto_intall = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }
