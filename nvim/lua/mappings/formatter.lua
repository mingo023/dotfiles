vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end, { nargs = "*" })
