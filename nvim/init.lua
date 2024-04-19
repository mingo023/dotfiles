vim.cmd([[
    syntax on
    if has('termguicolors')
      set termguicolors
    endif
]])

require("opts")
require("plugins")
require("mappings")

-- DISABLE AUTO COMMENT ON INSERT
vim.opt.formatoptions:remove { "c", "r", "o" }

