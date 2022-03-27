local map = require('utils.mapping')

map("n", "<Leader>mf", ":lua require(\"harpoon.mark\").add_file() <CR>")
map("n", "<Leader>om", ":lua require(\"harpoon.ui\").toggle_quick_menu() <CR>")
