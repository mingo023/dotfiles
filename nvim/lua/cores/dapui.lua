require("dapui").setup()

vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "Eval DAP" })

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

local icons = require("cores.icons").dap

vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

for name, sign in pairs(icons) do
  sign = type(sign) == "table" and sign or { sign }
  vim.fn.sign_define(
    "Dap" .. name,
    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  )
end
