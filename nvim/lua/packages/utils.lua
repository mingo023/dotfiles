
local packer = require "packer"
local use = packer.use

use {
    "preservim/vimux"
}

use {
    "RRethy/nvim-treesitter-textsubjects",
    config = function()
        require('nvim-treesitter.configs').setup {
            textsubjects = {
                enable = true,
                prev_selection = ',', -- (Optional) keymap to select the previous selection
                keymaps = {
                    ['.'] = 'textsubjects-smart',
                    [';'] = 'textsubjects-container-inner',
                },
            },
        }
    end
}
