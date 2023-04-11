local packer = require "packer"
local use = packer.use

use {
    'j-hui/fidget.nvim',
    config = function()
        require"fidget".setup{}
    end
}

use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require("cores.alpha")
    end
}

use { "Pocco81/true-zen.nvim" }
