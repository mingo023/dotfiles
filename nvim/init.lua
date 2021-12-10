require("plugins")
require("options")
require("mappings")

vim.cmd [[
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
]]