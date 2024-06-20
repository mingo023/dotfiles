local conform = require("conform")
local map = require("utils.mapping")

vim.api.nvim_create_user_command("Format", function()
  conform.format()
end, { nargs = "*" })

-- config auto format for php
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.php",
--   callback = function(args)
--     local ok, result = pcall(conform.format, { bufnr = args.buf })
--   end,
-- })

map("n", "<C-f>", ":Format<CR>", { noremap = true, silent = false })
