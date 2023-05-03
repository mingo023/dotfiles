local map = require('utils.mapping')

map("n", "<Leader>fb", ":Telescope buffers <CR>")
map("n", "<C-p>", ":Telescope git_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍 <CR>", { silent = true })
map("n", "<Leader>fg", ":Telescope live_grep find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍 <CR>", { silent = true })
map("n", "<Leader>ma", ":Telescope marks <CR>", { silent = true })
map("n", "gr", ":Telescope lsp_references <CR>", { silent = true })
map("n", "<Leader>sp", ":lua require'telescope.builtin'.lsp_document_symbols{} <CR>", { silent = true })
