local packer = require "packer"
local use = packer.use

use {
    "fatih/vim-go"
}

use {
    "neovim/nvim-lspconfig",
    config = function()
        require "lsp"
    end
}
use {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    after ="nvim-lspconfig"
}
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require "cores.treesitter"
    end
}
use {
    "williamboman/nvim-lsp-installer",
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
-- use {
--     "windwp/nvim-ts-autotag",
--     config = function()
--         require'nvim-treesitter.configs'.setup {
--             autotag = {
--                 enable = true
--             }
--         }
--     end
-- }

use {
    "mg979/vim-visual-multi"
}

use {
    "ThePrimeagen/harpoon"
}

use {
    "liuchengxu/vista.vim"
}

use 'mfussenegger/nvim-treehopper'

use {
    'j-hui/fidget.nvim',
    config = function()
        require"fidget".setup{}
    end
}
