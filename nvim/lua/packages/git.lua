local packer = require("packer")
local use = packer.use

use {
    "lewis6991/gitsigns.nvim",
    cond = function()
        return vim.fn.isdirectory ".git" == 1
    end,
    config = function()
        require("cores.gitsigns")
    end
}

use {"tpope/vim-fugitive"}
