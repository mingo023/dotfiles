local Terminal = require("toggleterm.terminal").Terminal
local term = Terminal:new({
  direction = "float",
  float_opts = {
    border = "curved",
  },
  -- function to run on opening the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _term_toggle()
  term:toggle()
end
