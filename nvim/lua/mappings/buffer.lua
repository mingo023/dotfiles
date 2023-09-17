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

map("n", "<Leader>p", ":BufferLinePick <CR>", {
  noremap = true,
  silent = true,
})
