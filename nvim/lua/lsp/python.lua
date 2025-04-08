local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

lsp_config.pylsp.setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        pyflakes = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        flake8 = { enabled = false },
        ruff = { enabled = false },
        pylint = { enabled = false },
        pycodestyle = { enabled = false },
      },
    },
  },
})

-- set shiftwidth to 2 spaces
vim.cmd([[
  autocmd BufEnter *.py setlocal
      \ shiftwidth=2
      \ tabstop=2
      \ softtabstop=2
      \ expandtab
  ]])
