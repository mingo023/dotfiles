local map = require('core.utils').map

map("n", "<Leader>q", ":TroubleToggle <CR>")
map("n", "gr", ":TroubleToggle lsp_references <CR>")
