local saga = require("lspsaga")

saga.setup({
  symbol_in_winbar = {
    enable = true,
  },
  ui = {
    border = "rounded",
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = false,
  },
})
