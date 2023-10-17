local notify = require("notify")
notify.setup({
  stages = "fade_in_slide_out",
  timeout = 1000,
  background_colour = "#2E3440",
  render = "minimal",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
vim.notify = notify
