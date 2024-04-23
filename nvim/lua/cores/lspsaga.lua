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
  definition = {
    height = 0.7,
    keys = {
      vsplit = "v",
      split = "s",
      edit = "<CR>",
      close = "q",
    },
  },
  finder = {
    right_width = 0.6,
    keys = {
      vsplit = "v",
      split = "s",
      toggle_or_open = "<CR>",
    },
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = false,
  },
})
