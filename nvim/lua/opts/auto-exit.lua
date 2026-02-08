-- Auto exit neovim if not used for more than 5 minutes
local M = {}

local idle_timer = nil
local idle_timeout = 5 * 60 * 1000 -- 5 minutes in milliseconds

local function reset_idle_timer()
  if idle_timer then
    idle_timer:stop()
  end
  idle_timer = vim.defer_fn(function()
    vim.cmd("qa!")
  end, idle_timeout)
end

function M.setup()
  local idle_group = vim.api.nvim_create_augroup("AutoExitIdle", { clear = true })
  vim.api.nvim_create_autocmd({
    "InsertEnter",
    "TextChanged",
    "BufEnter",
    "FocusGained",
    "CmdlineEnter",
  }, {
    group = idle_group,
    pattern = "*",
    callback = reset_idle_timer,
  })

  reset_idle_timer()
end

return M
