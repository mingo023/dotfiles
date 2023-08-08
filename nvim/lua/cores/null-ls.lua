local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local on_attach = require("lsp/on_attach")

local FORMATTING = methods.internal.FORMATTING

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua.with({ extra_args = { "config-path", "{$HOME}/.config/nvim/lua/stylua.toml" } }),
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines.with({ extra_args = { "-m", "120" } }),
    null_ls.builtins.formatting.prettierd,

    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.eslint_d,
  },
  on_attach = on_attach,
})
