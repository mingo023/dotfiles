local Terminal = require('toggleterm.terminal').Terminal
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

vim.api.nvim_set_keymap("n", "tk", "<cmd>lua _term_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', 'tk', '<C-\\><C-n> <cmd>lua _term_toggle()<CR>',{noremap = true, silent = true})
