local nvim_lsp = require('lspconfig')

-- set up diagnostics
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  cmd = {"diagnostic-languageserver", "--stdio"},
  filetypes={ "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = {
          ".eslitrc.js",
          "package.json"
        },
        debounce = 500,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint'
    },
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = {"--stdin-filepath" ,"%filepath" }
      }
    },
    formatFiletypes = {
      javascript = "prettier",
      typescript = "prettier"
    },
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        signs = true,
        underline = true,
        -- set this to true if you want diagnostics to show in insert mode
        update_in_insert = false
    }
)

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

