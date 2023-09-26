local map = vim.keymap.set

map("n", "<leader>to", function()
  require("neotest").run.run()
end , { noremap = true, silent = true })

map("n", "<leader>ta", function()
  require("neotest").run.run(vim.fn.expand("%"))
end , { noremap = true, silent = true })

map("n", "<leader>tn", function()
  vim.cmd("TestNearest")
end, { noremap = true, silent = true })

map("n", "<leader>tf", function()
  vim.cmd("TestFile")
end, { noremap = true, silent = true })
