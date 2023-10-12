local map = vim.keymap.set

map("n", "<Leader>ha", function()
  require("harpoon.mark").add_file()
end, { noremap = true, silent = true })
map("n", "<Leader>hm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { noremap = true, silent = true })
