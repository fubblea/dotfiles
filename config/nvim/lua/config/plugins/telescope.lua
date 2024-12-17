return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        -- Keybindings

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>ss', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope workspace symbols' })
    end
}
