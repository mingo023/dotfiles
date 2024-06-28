local map = vim.keymap.set

local harpoon = require("harpoon")

map("n", "<Leader>ha", function()
  harpoon:list():add()
end, { noremap = true, silent = true })
