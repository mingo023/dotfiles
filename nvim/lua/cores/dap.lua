local dap = require("dap")

local function get_arguments()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = "Args: " }, function(input)
        args = vim.split(input or "", " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = "Args: " }, function(input)
      args = vim.split(input or "", " ")
    end)
    return args
  end
end

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
  {
    type = "go",
    name = "Debug (Arguments)",
    request = "launch",
    program = "main.go",
    args = get_arguments,
  }
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
