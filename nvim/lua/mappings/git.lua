local map = require("utils.mapping")

map("n", "<Leader>gg", ":vertical Git<CR>:vertical resize 60<CR>")
map("n", "<Leader>gb", ":Gitsigns blame <CR>")
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

map("n", ",gcn", ":Git checkout -b ", {
  desc = "Create a new branch",
})

map("n", ",gcc", ":Git checkout ", {
  desc = "Switch to a branch",
})

map("n", ",gcm", ":Git commit <CR>", {
  desc = "Commit changes",
})

map("n", ",gp", ":Git push<CR>", {
  desc = "Push changes",
})
