local on_attach = require("lsp/on_attach")

vim.lsp.config("solargraph", {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
  end,
  settings = { solargraph = { diagnostics = true } },
})
