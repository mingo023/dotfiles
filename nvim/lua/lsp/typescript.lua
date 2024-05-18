local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

vim.cmd([[
autocmd BufEnter *.ts  setlocal
    \ shiftwidth=4
    \ filetype=typescript
]])

require("lspconfig").tsserver.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/Users/minhngo/.local/share/mise/installs/node/20.11.1/lib/node_modules/@vue/typescript-plugin",
        languages = { "vue" },
      },
    },
  },
  filetypes = {
    "vue",
  },
  on_attach = on_attach,
})

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cs", ":TSToolsOrganizeImports<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cR", ":TSToolsRenameFile<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ci", ":TSToolsAddMissingImports<CR>", { silent = true })

    on_attach(client, bufnr)
  end,
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
    },
  },
})

lsp_config.eslint.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
})
