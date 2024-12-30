vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  -- set this to true if you want diagnostics to show in insert mode
  update_in_insert = false,
})

vim.cmd([[
  hi DiagnosticUnderlineError gui=undercurl
  hi DiagnosticUnderlineWarn guisp='Cyan' gui=undercurl
  hi DiagnosticUnderlineInfo gui=undercurl
]])

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "rounded",
-- })

-- vim.notify = function(msg, log_level)
--   if msg:match("exit code") then
--     return
--   end
--   if log_level == vim.log.levels.ERROR then
--     vim.api.nvim_err_writeln(msg)
--   else
--     vim.api.nvim_echo({ { msg } }, true, {})
--   end
-- end

-- vim.diagnostic.config({
--   float = { border = "rounded" },
--   virtual_text = true,
-- })

-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float({focusable=false})]])
