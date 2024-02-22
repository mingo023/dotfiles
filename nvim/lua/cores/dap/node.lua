local dap = require("dap")

if not dap.adapters["pwa-node"] then
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "::1",
    port = "${port}",
    executable = {
      command = "js-debug-adapter",
      args = {
        "${port}",
      },
    },
  }
end

for _, lang in ipairs({ "javascript", "typescript" }) do
  dap.configurations[lang] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Node app",
      address = "localhost",
      port = function()
        return vim.fn.input("Select port: ", 9229)
      end,
      cwd = "${workspaceFolder}",
      restart = true,
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with jest)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
      runtimeExecutable = "node",
      args = { "${file}", "--config", "jest-config.json", "--coverage", "false" },
      rootPath = "${workspaceFolder}",
      sourceMaps = true,
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch NestJS",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "run", "start:debug" },
      runtimeExecutable = "npm",
      rootPath = "${workspaceFolder}",
      sourceMaps = true,
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
  }
end
