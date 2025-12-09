local conform = require("conform")
local map = require("utils.mapping")

vim.api.nvim_create_user_command("Format", function()
  conform.format()
  local ft = vim.bo.filetype
  if ft == "typescript" or ft == "javascript" or ft == "typescriptreact" or ft == "javascriptreact" then
    vim.cmd("LspEslintFixAll")
  end
end, { nargs = "*" })

map("n", "<C-f>", ":Format<CR>", { noremap = true, silent = false })
