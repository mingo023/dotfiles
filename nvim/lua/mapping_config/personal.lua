local map = require('core.utils').map

-- escape from insert mode
map("i", "jj", "<Esc>")

-- enable copy to clipboard
map("v", "<C-c>", '"+y')

-- remove matchings
map("n", "<Leader>dm", ":noh <CR>", { silent = true})

-- search all the words match with current selection
map("v", "/", "y/<C-R>\"<CR>", { silent = true })

-- mapping for shift multiple lines repeatedly
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

map("n", ":ư", ":w")
