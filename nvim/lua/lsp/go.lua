local lsp_config = require 'lspconfig'
local on_attach = require 'lsp/on_attach'

vim.cmd[[
autocmd BufEnter *.go  setlocal
    \ tabstop=8 shiftwidth=8 softtabstop=8 textwidth=80 noexpandtab
    \ cindent cinoptions=:0,l1,t0,g0,(0,W8
    \ filetype=go
]]

lsp_config.gopls.setup{
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}
