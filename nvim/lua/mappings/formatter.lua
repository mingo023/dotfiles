vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end, { nargs = "*" })

local map = require("utils.mapping")

map("n", "<C-f>", ":Format<CR>", { noremap = true, silent = true})
