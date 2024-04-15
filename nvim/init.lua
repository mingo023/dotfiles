vim.cmd([[
    syntax on
    if has('termguicolors')
      set termguicolors
    endif
]])

require("opts")
require("plugins")
require("mappings")
