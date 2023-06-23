local map = require("utils.mapping")

map("n", ",bb", ":bufdo bwipeout <CR>", {
  noremap = true,
  silent = true,
})
map("n", ",bn", ":bn <CR>", {
  noremap = true,
  silent = true,
})
map("n", ",bp", ":bp <CR>", {
  noremap = true,
  silent = true,
})

for i = 1,9 do
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
end
