local packer = require "packer"
local use = packer.use

use {"preservim/vimux"}

use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup {} end
}

