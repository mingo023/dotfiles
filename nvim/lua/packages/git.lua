local packer = require("packer")
local use = packer.use

use {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("cores.gitsigns")
    end
}

use {"tpope/vim-fugitive"}

use {
    "akinsho/git-conflict.nvim",
    config = function()
        require('git-conflict').setup()
    end
}
