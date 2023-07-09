local dap = require("dap")

local function setup_delve_adapter(dap, config)
  local args = { "dap", "-l", "127.0.0.1:" .. config.delve.port }
  vim.list_extend(args, config.delve.args)

  dap.adapters.go = {
    type = "server",
    port = config.delve.port,
    executable = {
      command = config.delve.path,
      args = args,
    },
    options = {
      initialize_timeout_sec = config.delve.initialize_timeout_sec,
    },
  }
end

setup_delve_adapter(dap, {
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {},
  },
})

dap.configurations.go = {
  {
    name = "Run server",
    type = "go",
    request = "launch",
    program = "main.go",
    args = { "server" },
  },
  {
    name = "Run index veh shop",
    type = "go",
    request = "launch",
    program = "main.go",
    args = { "index_veh_shops" },
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
