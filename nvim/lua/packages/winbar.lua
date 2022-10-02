local packer = require "packer"
local use = packer.use

use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
        require("cores.winbar")
    end
}
