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
            require "configs.lspconfig"
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require "configs.treesitter"
        end
    }

    -- ------------------------------------------------------------
    -- |            ✨ Auto pair - Indent - Suggestion ✨          |
    -- ------------------------------------------------------------

    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("nvim-autopairs").setup()
            require("nvim-autopairs.completion.compe").setup({
                map_cr = true,
                map_complete = true -- insert () func completion
            })
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('configs.indent-blankline')
        end
    }

    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require('configs.compe')
        end
    }

    -- ------------------------------------------------------------
    -- |             👾 File - Folder - Statusline 👾              |
    -- ------------------------------------------------------------

    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require "configs.nvimtree"
        end
    }

    use {
        "kyazdani42/nvim-web-devicons",
        after = "nvim-base16.lua",
        config = function()
            require "configs.icons"
        end
    }

    use {
        "glepnir/galaxyline.nvim",
        disable = not plugin_status.galaxyline,
        after = "nvim-web-devicons",
        config = function()
            require "configs.statusline"
        end
    }

    use {
        "NvChad/nvim-base16.lua",
        after = "packer.nvim",
        config = function()
            -- require("colors").init('onedark')
            require("colors").init('onedark')
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
            require "configs.bufferline"
        end
    }

    use {
        "mhartington/formatter.nvim",
        config = function()
            require "configs.prettier"
        end
    }

    use {
        "terrortylor/nvim-comment",
        config = function()
            require "configs.comment"
        end
    }

    -- ------------------------------------------------------------
    -- |                 🪐 Coding experience  🪐                 |
    -- ------------------------------------------------------------

    use { "tpope/vim-surround" }

    use { "matze/vim-move" }

    use { 
        "justinmk/vim-sneak", 
        config = function()
            require "configs.sneak"
        end
    }

    use "terryma/vim-multiple-cursors"

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
            require "configs.gitsigns"
        end
    }

    use {"tpope/vim-fugitive"}

end)
