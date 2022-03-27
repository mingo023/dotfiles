local lsp_config = require 'lspconfig'
local on_attach = require 'lsp/on_attach'

lsp_config.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)

        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup {
          update_imports_on_move = true
        }
        ts_utils.setup_client(client)

        vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>co", ":TSLspOrganize<CR>",   { silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cR", ":TSLspRenameFile<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ci", ":TSLspImportAll<CR>",  { silent = true })
    end,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx"},
    root_dir = function()
        return vim.fn.getcwd()
    end
})

-- require'lspconfig'.gopls.setup {
--     on_attach = function(client)
--       -- [[ other on_attach code ]]
--       require 'illuminate'.on_attach(client)
--     end,
-- }
