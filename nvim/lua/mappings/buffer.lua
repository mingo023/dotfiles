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

map("n", "<Leader>a", "<Cmd>BufferLineGoToBuffer 1<CR>", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>s", "<Cmd>BufferLineGoToBuffer 2<CR>", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>d", "<Cmd>BufferLineGoToBuffer 3<CR>", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>f", "<Cmd>BufferLineGoToBuffer 4<CR>", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>g", "<Cmd>BufferLineGoToBuffer 5<CR>", {
  noremap = true,
  silent = true,
})
