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

vim.diagnostic.config {
  float = { border = "rounded" },
  virtual_text = false,
}

vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({focusable=false})]]
