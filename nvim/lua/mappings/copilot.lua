local map = require("utils.mapping")

map("i", "<C-j>", "copilot#Accept()", { noremap = true, silent = true, expr = true })
