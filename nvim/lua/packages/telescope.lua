local packer = require("packer")
local use = packer.use

use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function()
        require("cores.telescope")
    end
}
