local on_attach = require("lsp/on_attach")

vim.lsp.config("buf_ls", {
  on_attach = on_attach,
})
