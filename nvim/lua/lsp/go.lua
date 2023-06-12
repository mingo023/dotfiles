local lsp_config = require 'lspconfig'
local on_attach = require 'lsp/on_attach'

vim.cmd[[
autocmd BufEnter *.go  setlocal
    \ tabstop=8 shiftwidth=8 softtabstop=8 textwidth=80 noexpandtab
    \ cindent cinoptions=:0,l1,t0,g0,(0,W8
    \ filetype=go
]]

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

lsp_config.gopls.setup{
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
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
}
