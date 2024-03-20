local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

vim.cmd([[
autocmd BufEnter *.ts  setlocal
    \ shiftwidth=4
    \ filetype=typescript
]])

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cs", ":TSToolsSortImports<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cR", ":TSToolsRenameFile<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ci", ":TSToolsAddMissingImports<CR>", { silent = true })

    on_attach(client, bufnr)
  end,
})
lsp_config.eslint.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
})
