local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

lsp_config.solargraph.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
  end,
  settings = { solargraph = { diagnostics = true } },
})
