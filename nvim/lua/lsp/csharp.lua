local on_attach = require("lsp/on_attach")

-- set shiftwidth to 2 spaces
vim.cmd([[
  autocmd BufEnter *.cs setlocal
      \ shiftwidth=4
  ]])

vim.lsp.config("roslyn", {
  on_attach = on_attach,
  settings = {
    settings = {
      ["csharp|formatting"] = {
        dotnet_organize_imports_on_format = true,
      },
    },
  },
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.get_clients({ name = "roslyn" })
    if not clients or #clients == 0 then
      return
    end

    local buffers = vim.lsp.get_buffers_by_client_id(clients[1].id)
    for _, buf in ipairs(buffers) do
      vim.lsp.util._refresh("textDocument/diagnostic", { bufnr = buf })
    end
  end,
})
