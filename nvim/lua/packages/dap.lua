return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      require("cores.dap.go")
      require("cores.dap.node")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("cores.dapui")
    end,
  },
}
