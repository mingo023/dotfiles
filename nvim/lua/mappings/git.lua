local map = require("utils.mapping")

map("n", "<Leader>gg", ":Git<CR>:16wincmd_<CR>")
map("n", "<Leader>gb", ":Git blame <CR>")
map("n", "<Leader>gw", ":Gwrite <CR>")
map("n", "<Leader>gdd", ":Gvdiffsplit! <CR>")

-- Open merge tool
map("n", "<Leader>cb", "<Plug>(git-conflict-both)")
map("n", "<Leader>c0", "<Plug>(git-conflict-none)")
map("n", "<Leader>co", "<Plug>(git-conflict-ours)")
map("n", "<Leader>ct", "<Plug>(git-conflict-theirs)")
map("n", "<Leader>cn", "<Plug>(git-conflict-next-conflict)")
map("n", "<Leader>cp", "<Plug>(git-conflict-prev-conflict)")
map("n", "<Leader>gq", ":GitConflictListQf <CR>")
