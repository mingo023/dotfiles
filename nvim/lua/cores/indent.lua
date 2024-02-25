vim.opt.list = true
vim.opt.listchars:append("eol:↲")
-- vim.opt.listchars:append("space:⋅")

require("ibl").setup({
  indent = {
    char = "┊",
    tab_char = "┊",
  },
  scope = {
    enabled = false,
  },
})
