local packer = require "packer"
local use = packer.use

use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        -- require("cores.indent").config()
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
