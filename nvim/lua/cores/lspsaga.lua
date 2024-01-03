local saga = require("lspsaga")

saga.setup({
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    border = "rounded",
  },
  beacon = {
    enable = false,
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = false,
  },
})
