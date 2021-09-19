local map = require('core.utils').map

map("n", "<Leader>ca", ":Lspsaga code_action <CR>", { silent = true, noremap = true })
map("n", "K", ":Lspsaga hover_doc <CR>")
map("n", "<C-r>", ":Lspsaga rename <CR>")
