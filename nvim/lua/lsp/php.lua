local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

-- lsp_config.psalm.setup({
--   on_attach = on_attach,
-- })

-- lsp_config.phpactor.setup({
--   on_attach = on_attach,
--   root_pattern = { "composer.json", ".git" },
--   init_options = {
--     ["language_server_phpstan.enabled"] = false,
--     ["language_server_psalm.enabled"] = false,
--   },
--   default_config = {
--     cmd = { "phpactor", "language-server" },
--     filetypes = { "php" },
--     root_dir = lsp_config.util.root_pattern("composer.json", ".git", "src/composer.json"),
--   },
-- })
require("lspconfig").intelephense.setup({
  on_attach = on_attach,
})
