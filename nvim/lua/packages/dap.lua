return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("cores.dap.go")
      require("cores.dap.node")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("cores.dapui")
    end,
  },
}
