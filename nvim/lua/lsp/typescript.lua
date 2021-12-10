local lsp_config = require 'lspconfig'
local on_attach = require 'lsp/on_attach'

lsp_config.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx", "javascript"}
})
