vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    local plugin_status = require("core.utils").load_config().plugin_status

    use {
        "wbthomason/packer.nvim",
        event = "VimEnter"
    }

    -- ------------------------------------------------------------
    -- |                   🌈 Lsp - Treesitter 🌈                  |
    -- ------------------------------------------------------------

    use {
        "kabouzeid/nvim-lspinstall",
        event = "BufRead"
    }

    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("configs.treesitter")
        end
    }

    use {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        requires = {{'nvim-lua/plenary.nvim', 'jose-elias-alvarez/null-ls.nvim'}}
    }

    use {"glepnir/lspsaga.nvim"}

    -- ------------------------------------------------------------
    -- |            ✨ Auto pair - Indent - Suggestion ✨          |
    -- ------------------------------------------------------------

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {{'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'hrsh7th/cmp-cmdline'},
                    {'hrsh7th/cmp-vsnip'}, {'hrsh7th/vim-vsnip'}},
        config = function()
            require "configs.cmp"
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('configs.indent-blankline')
        end
    }

    -- use {
    --     "hrsh7th/nvim-compe",
    --     event = "InsertEnter",
    --     config = function()
    --         require('configs.compe')
    --     end
    -- }

    -- ------------------------------------------------------------
    -- |             👾 File - Folder - Statusline 👾              |
    -- ------------------------------------------------------------

    use {
        'kyazdani42/nvim-tree.lua',
        commit = '86e6dc6',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require'nvim-tree'.setup {}
        end
    }

    use {
        "kyazdani42/nvim-web-devicons",
        after = "nvim-base16.lua",
        config = function()
            require("configs.icons")
        end
    }

    use {
        "glepnir/galaxyline.nvim",
        disable = not plugin_status.galaxyline,
        after = "nvim-web-devicons",
        config = function()
            require("configs.statusline")
        end
    }

    use {
        "NvChad/nvim-base16.lua",
        after = "packer.nvim",
        config = function()
            require("colors").init('onedark')
        end
    }

    -- ------------------------------------------------------------
    -- |                  🎃 Themes and color 🎃                  |
    -- ------------------------------------------------------------

    use "sainnhe/gruvbox-material"
    use 'folke/tokyonight.nvim'

    use {
        'folke/lsp-colors.nvim',
        config = function()
            require("lsp-colors").setup({
                Error = "#db4b4b",
                Warning = "#e0af68",
                Information = "#0db9d7",
                Hint = "#10B981"
            })
        end
    }

    -- ------------------------------------------------------------
    -- |                   🎃 Coding styles 🎃                    |
    -- ------------------------------------------------------------
    use {
        "akinsho/bufferline.nvim",
        disable = not plugin_status.bufferline,
        after = "galaxyline.nvim",
        config = function()
            require("configs.bufferline")
        end
    }

    use {
        "mhartington/formatter.nvim",
        config = function()
            require("configs.prettier")
        end
    }

    use {
        'b3nj5m1n/kommentary',
        config = function()
            require("configs.comment")
        end
    }

    use "preservim/vimux"

    -- ------------------------------------------------------------
    -- |                 🪐 Coding experience  🪐                 |
    -- ------------------------------------------------------------

    use {"tpope/vim-surround"}

    use {"matze/vim-move"}

    use {
        "justinmk/vim-sneak",
        config = function()
            require("configs.sneak")
        end
    }

    use "terryma/vim-multiple-cursors"

    use "kamykn/spelunker.vim"

    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup({
                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil -- Function to run after the scrolling animation ends
            })
        end
    }

    -- ------------------------------------------------------------
    -- |                🪐 Telescope - Dashboard 🪐                |
    -- ------------------------------------------------------------
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function()
            require "configs.telescope"
        end
    }

    use {
        "glepnir/dashboard-nvim",
        config = function()
            require "configs.dashboard"
        end
    }

    use "Pocco81/TrueZen.nvim"

    use {
        "folke/trouble.nvim",
        commit = 'ff40475',
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require "configs.trouble"
        end
    }

    -- ------------------------------------------------------------
    -- |                          ⛄️ Git ⛄️                       |
    -- ------------------------------------------------------------
    use {
        "lewis6991/gitsigns.nvim",
        disable = not plugin_status.gitsigns,
        cond = function()
            return vim.fn.isdirectory ".git" == 1
        end,
        config = function()
            require("configs.gitsigns")
        end
    }

    use {"tpope/vim-fugitive"}

end)
