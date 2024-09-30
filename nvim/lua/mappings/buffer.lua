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
  map("n", ("<Leader>%s"):format(i), ("<Cmd>BufferLineGoToBuffer %s<CR>"):format(i), {
    noremap = true,
    silent = true,
  })
end
