local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Save breakpoints to file automatically.
keymap("n", "<Leader>bp", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<Leader>cbp", "<cmd>lua require('dap').clear_breakpoints()<cr>", opts)
keymap("n", "<Leader>ds", "<cmd>lua require('dap').continue()<cr>", opts)
