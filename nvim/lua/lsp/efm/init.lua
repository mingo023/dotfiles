local lsp_config = require("lspconfig")
local on_attach = require("lsp.on_attach")
local eslint = require("lsp.efm.eslint")
local prettier = require("lsp.efm.prettier")

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = {'package.json', '.git/', '.zshrc'}
local efm_languages = {
    typescript = {eslint, prettier}
}

lsp_config.efm.setup({
    cmd = {"efm-langserver", "-c", efm_config, "-logfile", efm_log_dir .. "efm.log"},
    filetype = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
    on_attach = on_attach,
    root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
    init_options = {
        documentFormatting = false
    },
    settings = {
        rootMarkers = efm_root_markers,
        languages = efm_languages
    }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    -- set this to true if you want diagnostics to show in insert mode
    update_in_insert = false
})

vim.fn.sign_define("LspDiagnosticsSignError", {
    text = "",
    numhl = "LspDiagnosticsDefaultError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    text = "",
    numhl = "LspDiagnosticsDefaultWarning"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    text = "",
    numhl = "LspDiagnosticsDefaultInformation"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    text = "",
    numhl = "LspDiagnosticsDefaultHint"
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
