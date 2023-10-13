local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

lsp_config.tailwindcss.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
})
