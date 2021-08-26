local map = require('core.utils').map

map("n", "<Leader>fb", ":Telescope buffers <CR>")
map("n", "<Leader>ff", ":Telescope find_files <CR>")
map("n", "<Leader>fg", ":Telescope live_grep <CR>")