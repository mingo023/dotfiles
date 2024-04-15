local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

require("lspconfig").intelephense.setup({
  on_attach = on_attach,
})
