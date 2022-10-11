local map = require('utils.mapping')

map("n", "<Leader>gg", ":Git <CR>")
map("n", "<Leader>gb", ":Git blame <CR>")
map("n", "<Leader>gw", ":Gwrite <CR>")
map("n", "<Leader>gdd", ":Gdiffsplit <CR>")
map("n", "<Leader>gd2", ":diffget //2 <CR>")
map("n", "<Leader>gd3", ":diffget //3 <CR>")


-- Git conflict

-- map('n', '<Leader>co', ':GitConflictChooseOur <CR>')
map('n', '<Leader>cb', '<Plug>(git-conflict-both)')
map('n', '<Leader>c0', '<Plug>(git-conflict-none)')
map('n', '<Leader>ct', '<Plug>(git-conflict-theirs)')
map('n', '<Leader>cn', '<Plug>(git-conflict-next-conflict)')
map('n', '<Leader>cp', '<Plug>(git-conflict-prev-conflict)')
map('n', '<Leader>gq', ':GitConflictListQf <CR>')

