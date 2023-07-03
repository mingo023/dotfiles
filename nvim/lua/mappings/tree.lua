local map = require("utils.mapping")

map("n", "<Leader>e", ":NvimTreeToggle <CR>", {
  noremap = true,
  silent = true,
})
