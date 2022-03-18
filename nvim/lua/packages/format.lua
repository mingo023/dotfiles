local packer = require "packer"
local use = packer.use

use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
        require('nvim-autopairs').setup{}
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    end
}

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

use {
    "tpope/vim-surround"
} 

use {
    "justinmk/vim-sneak",
    config = function()
        vim.cmd("let g:sneak#label = 1")
    end
}

use {
    "kamykn/spelunker.vim"
}
