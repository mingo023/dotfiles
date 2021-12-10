local packer = require "packer"
local use = packer.use

use {
    "neovim/nvim-lspconfig",
    config = function()
        require "lsp"
    end
}
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}
use {
    "kabouzeid/nvim-lspinstall",
    event = "BufRead"
}
use {"tami5/lspsaga.nvim"}
use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
}
use {"github/copilot.vim"}

use {
    "windwp/nvim-ts-autotag",
    config = function()
        require'nvim-treesitter.configs'.setup {
            autotag = {
                enable = true
            }
        }
    end
}

