return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>hh", function()
      harpoon:list():add()
    end, { desc = "Add to harpoon list" })

    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to mark 1" })
    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon to mark 2" })
    vim.keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon to mark 3" })
    vim.keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon to mark 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Go to next harpoon buffer" })
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Go to previous harpoon buffer" })

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>hw", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}
