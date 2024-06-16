local map = require("utils.mapping")

map("n", "<Leader>td", ":Trouble diagnostics toggle filter.buf=0<CR>", {
  silent = true,
})
