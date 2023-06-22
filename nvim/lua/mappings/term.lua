vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "tk", "<cmd>lua _term_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "tk", "<C-\\><C-n> <cmd>lua _term_toggle()<CR>", { noremap = true, silent = true })
