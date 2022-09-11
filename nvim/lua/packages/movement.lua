local packer = require "packer"
local use = packer.use

use 'mfussenegger/nvim-treehopper'

use {
    'phaazon/hop.nvim',
    config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
}
