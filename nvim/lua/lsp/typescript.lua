local on_attach = require("lsp/on_attach")

vim.cmd([[
  autocmd BufEnter *.ts setlocal
      \ shiftwidth=2
      \ filetype=typescript
  ]])

local current_workspace = vim.fn.getcwd()
local hodfords_path = "hodfords"

if string.find(current_workspace, hodfords_path) then
  vim.cmd([[
    autocmd BufEnter *.ts setlocal
        \ shiftwidth=4
        \ filetype=typescript
    ]])
end

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cs", ":TSToolsOrganizeImports<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cR", ":TSToolsRenameFile<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ci", ":TSToolsAddMissingImports<CR>", { silent = true })

    on_attach(client, bufnr)
  end,
  single_file_support = true,
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
    },
  },
})

require("lspconfig").eslint.setup({
  on_attach = on_attach,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
  },
  root_dir = function()
    return vim.fn.getcwd()
  end,
})

vim.lsp.enable("eslint")
