return {
  "kkoomen/vim-doge",

  config = function()
    -- Generate comment for current line
    vim.keymap.set("n", "<Leader>cd", "<Plug>(doge-generate)")

    -- Interactive mode comment todo-jumping
    vim.keymap.set("n", "<TAB>", "<Plug>(doge-comment-jump-forward)")
    vim.keymap.set("n", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
    vim.keymap.set("i", "<TAB>", "<Plug>(doge-comment-jump-forward)")
    vim.keymap.set("i", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
    vim.keymap.set("x", "<TAB>", "<Plug>(doge-comment-jump-forward)")
    vim.keymap.set("x", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")

    vim.cmd([[
      let g:doge_doc_standard_python = 'numpy'
    ]])
  end,
}
