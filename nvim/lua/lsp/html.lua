local lsp_config = require 'lspconfig'
local on_attach = require 'lsp/on_attach'

lsp_config.html.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end,
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "typescriptreact" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    },
    root_dir = function(startpath)
        return M.search_ancestors(startpath, matcher)
      end,
    settings = {},
    single_file_support = true
})
