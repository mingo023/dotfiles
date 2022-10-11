local packer = require "packer"
local use = packer.use

-- GOLANG SETUP
use {
    'ray-x/go.nvim',
    requires = 'ray-x/guihua.lua',
    config = function()
        require('go').setup()
    end
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
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
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
    "mg979/vim-visual-multi"
}

use {
    "liuchengxu/vista.vim",
    config = function()
        require "cores.vista"
    end

}

