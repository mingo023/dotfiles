local packer = require "packer"
local use = packer.use

-- GOLANG SETUP
use {
    'ray-x/go.nvim',
    config = function()
        require('go').setup()
        -- Run gofmt + goimport on save
        vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

    end
}
use 'ray-x/guihua.lua' -- recommanded if need floating window support

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

use {
    "mg979/vim-visual-multi"
}

use {
    "liuchengxu/vista.vim",
    config = function()
        require "cores.vista"
    end

}

