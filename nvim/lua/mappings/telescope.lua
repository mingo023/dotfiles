local map = require('utils.mapping')

map("n", "<Leader>fb", ":Telescope buffers <CR>")
map("n", "<C-p>", ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍 <CR>")
map("n", "<Leader>fg", ":Telescope live_grep find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍 <CR>")
