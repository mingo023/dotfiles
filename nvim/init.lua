vim.cmd([[
    syntax on
    if has('termguicolors')
      set termguicolors
    endif
]])

require("plugins")
require("mappings")
require("opts")
