local conform = require("conform")
local map = require("utils.mapping")

vim.api.nvim_create_user_command("Format", function()
  conform.format()
end, { nargs = "*" })

map("n", "<C-f>", ":Format<CR>", { noremap = true, silent = true })
