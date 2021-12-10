local packer = require "packer"
local use = packer.use

use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons' -- optional, for file icon
    },
    config = function()
        require("cores.tree")
    end
}
