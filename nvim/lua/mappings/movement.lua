local map = vim.keymap.set

local harpoon = require("harpoon")

map("n", "<Leader>ha", function()
  harpoon:list():add()
end, { noremap = true, silent = true })

map("n", "<Leader>hm", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true, silent = true })
