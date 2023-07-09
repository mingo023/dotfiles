return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("cores.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("cores.dapui")
    end,
  },
  {
    "folke/neodev.nvim",
  },
}
