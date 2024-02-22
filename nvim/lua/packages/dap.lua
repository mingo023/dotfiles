return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("cores.dap.go")
      require("cores.dap.node")

      vim.fn.sign_define("DapBreakpoint", { text = "🦆", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("cores.dapui")
    end,
  },
}
