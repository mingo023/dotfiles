local packer = require "packer"
local use = packer.use

use {
    'tamton-aquib/staline.nvim',
    config = function()
        require("cores.statusline")
    end
}

