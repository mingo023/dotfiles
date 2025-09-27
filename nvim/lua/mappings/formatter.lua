local conform = require("conform")
local map = require("utils.mapping")

vim.api.nvim_create_user_command("Format", function()
  conform.format()

  -- run Eslintfix command only for typescript and javascript files
  local ft = vim.bo.filetype
  if ft == "typescript" or ft == "javascript" or ft == "typescriptreact" or ft == "javascriptreact" then
    vim.cmd("EslintFixAll")
  end
end, { nargs = "*" })

map("n", "<C-f>", ":Format<CR>", { noremap = true, silent = false })
