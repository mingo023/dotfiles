local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

map('n', '<leader>q', '@q', opts)
map('v', '<leader>q', ':%norm! @q<CR>', opts)
