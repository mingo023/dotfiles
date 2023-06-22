local map = require("utils.mapping")

map("n", "<Leader>ne", ":NvimTreeToggle <CR>", {
  noremap = true,
  silent = true,
})
