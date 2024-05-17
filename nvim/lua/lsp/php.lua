local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

require("lspconfig").intelephense.setup({
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  format = {
    enable = true,
  },
  on_attach = on_attach,
})
