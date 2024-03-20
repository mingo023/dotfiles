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
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("cores.dapui")
    end,
  },
}
