local packer = require "packer"
local use = packer.use

use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
        local present1, autopairs = pcall(require, "nvim-autopairs")
        local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

        if not (present1 or present2) then
          return
        end

        autopairs.setup()

        local cmp = require "cmp"
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
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
    "matze/vim-move",
    config = function()
        vim.cmd("let g:move_key_modifier = 'C'")
    end
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
