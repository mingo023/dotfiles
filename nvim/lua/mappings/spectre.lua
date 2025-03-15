local map = require("utils.mapping")
map("n", "<Leader>fw", ':lua require("spectre").open() <CR>', {
  desc = "Search current word",
})
map("v", "<Leader>fw", ':lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
