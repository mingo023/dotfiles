local map = require("utils.mapping")

map("i", "<C-J>", "copilot#Accept()", { noremap = true, silent = true, expr = true })
