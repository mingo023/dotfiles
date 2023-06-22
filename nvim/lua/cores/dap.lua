local dap = require("dap")

dap.adapters.go = {
  type = "server",
  port = "38697",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
    args = { "dap", "-l", "127.0.0.1:57083" },
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
