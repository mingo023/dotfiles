local map = vim.keymap.set

map("n", "<leader>tn", function()
  vim.cmd("TestNearest")
end, { noremap = true, silent = true })

map("n", "<leader>tf", function()
  vim.cmd("TestFile")
end, { noremap = true, silent = true })
