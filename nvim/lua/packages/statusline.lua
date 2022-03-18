local packer = require "packer"
local use = packer.use

use {
    'dsych/galaxyline.nvim',
    -- branch = 'main',
    commit = '586ed3b6c8f0e066606f6b621b0b34bdb1c9fe57',
    config = function()
        require("cores.statusline")
    end,
    requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
    }
}
