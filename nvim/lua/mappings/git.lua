local map = require('utils.mapping')

map("n", "<Leader>gg", ":Git <CR>")
map("n", "<Leader>gb", ":Git blame <CR>")
map("n", "<Leader>gw", ":Gwrite <CR>")
map("n", "<Leader>gdd", ":Gdiffsplit <CR>")
map("n", "<Leader>gd2", ":diffget //2 <CR>")
map("n", "<Leader>gd3", ":diffget //3 <CR>")
