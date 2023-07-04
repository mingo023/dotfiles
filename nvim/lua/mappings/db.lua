local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>du", ":DBUIToggle<CR>", opts)
