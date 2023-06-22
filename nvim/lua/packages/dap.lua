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
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            name = "Attach (127.0.0.1:57083)",
            type = "go",
            mode = "remote",
            request = "attach",
            port = "57083",
          },
        },
        delve = {
          -- the path to the executable dlv which will be used for debugging.
          -- by default, this is the "dlv" executable on your PATH.
          path = "dlv",
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          -- port = "57083",
          -- additional args to pass to dlv
          args = {},
        },
      })
    end,
  },
}
