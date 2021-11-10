local map = require('core.utils').map

map("n", "<Leader>fb", ":Telescope buffers <CR>")
map("n", "<C-p>", ":Telescope git_files prompt_prefix=🔍 <CR>")
map("n", "<Leader>fg", ":Telescope live_grep  prompt_prefix=🔍 <CR>")
