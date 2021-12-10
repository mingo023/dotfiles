local packer = require "packer"
local use = packer.use

use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require("cores.bufferline")
    end
}
