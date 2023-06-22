local notify = require("notify")
notify.setup({
  stages = "fade_in_slide_out",
  timeout = 1000,
  background_colour = "#1e222a",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
vim.notify = notify
