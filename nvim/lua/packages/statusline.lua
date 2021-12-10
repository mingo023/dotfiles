local packer = require "packer"
local use = packer.use

use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function()
        require("cores.statusline")
    end,
    requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
    }
}
