local packer = require "packer"
local use = packer.use

use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
        require("cores.auto-pair")
    end
}

use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("cores.indent")
    end
}

use {
    'b3nj5m1n/kommentary',
    config = function()
        require('kommentary.config').configure_language("default", {
            prefer_single_line_comments = true
        })
    end
}

use {
    "mhartington/formatter.nvim",
    config = function()
        require("cores.formatter")
    end
}

use {
    "tpope/vim-surround"
} 

use {
    "kamykn/spelunker.vim"
}

use {
    "windwp/nvim-spectre",
    config = function()
        require("cores.spectre")
    end
}
