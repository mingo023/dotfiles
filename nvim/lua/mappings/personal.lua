local map = require("utils.mapping")

-- escape from insert mode
map("i", "jj", "<Esc>")

-- enable copy to clipboard
map("v", "<C-c>", '"+y')

-- remove matchings
map("n", "<Leader>dm", ":noh <CR>", { silent = true })

-- search all the words match with current selection
map("v", "/", 'y/<C-R>"<CR>N', { silent = true })

-- mapping for shift multiple lines repeatedly
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

map("n", "<Leader>jt", ":RunJestFocused <CR>")

map("n", "<Leader>ff", ":EslintFixAll <CR>", {
  silent = true,
})
map("n", "<C-s>", ":w <CR>")
map("v", ":", ":s/")

-- override paste try to copying back to clipboard
-- map("v", "p", "\"_dP", {
--     silent = true
-- })
