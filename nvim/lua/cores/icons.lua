local M = {}

M = {
  dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
  },
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " ",
  },
  tree = {
    folder = {
      default = "",
      open = "",
      empty_open = "",
      empty = "",
      symlink = "",
    },
  },
}

return M
