local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

lsp_config.gopls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
      end,
    })
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
})
