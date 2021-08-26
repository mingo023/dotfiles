local map = require('core.utils').map

map("n", "<Leader>bd", ":bp|bd #<CR>", {noremap = true, silent = true})
map("n", "<Leader>bn", ":bn <CR>", {noremap = true, silent = true})
map("n", "<Leader>bp", ":bp <CR>", {noremap = true, silent = true})