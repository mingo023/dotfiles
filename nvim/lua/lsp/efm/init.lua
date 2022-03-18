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

vim.notify = function(msg, log_level)
    if msg:match "exit code" then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end

local function lspSymbol(name, icon)
    vim.fn.sign_define(
        "DiagnosticSign".. name,
        { text = icon, numhl = "DiagnosticDefault".. name }
    )
end
lspSymbol("Error", "❗")
lspSymbol("Information", "ℹ️")
lspSymbol("Hint", "💡")
lspSymbol("Info", "💡")
lspSymbol("Warning", "⚠️")

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({focusable=false})]]
