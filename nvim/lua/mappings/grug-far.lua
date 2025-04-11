local map = require("utils.mapping")

map("n", "<leader>fw", function()
  require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, {
  desc = "Search current word",
})

map("v", "<leader>fw", function()
  require("grug-far").with_visual_selection({})
end, {
  desc = "Search current word",
})

map("n", "<leader>R", function()
  require("grug-far").open()
end, {
  desc = "Open grug-far",
})
