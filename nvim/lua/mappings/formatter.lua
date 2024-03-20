local conform = require("conform")

vim.api.nvim_create_user_command("Format", function()
  conform.format()
end, { nargs = "*" })

local map = require("utils.mapping")

map("n", "<C-f>", ":Format<CR>", { noremap = true, silent = true })
