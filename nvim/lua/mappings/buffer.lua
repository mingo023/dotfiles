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

map("n", "<Leader>1", "<Plug>(cokeline-focus-1)", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>2", "<Plug>(cokeline-focus-2)", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>3", "<Plug>(cokeline-focus-3)", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>4", "<Plug>(cokeline-focus-4)", {
  noremap = true,
  silent = true,
})
map("n", "<Leader>5", "<Plug>(cokeline-focus-5)", {
  noremap = true,
  silent = true,
})
