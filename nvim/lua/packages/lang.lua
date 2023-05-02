return {
  {
    "fatih/vim-go"
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils", 
    dependencies = "nvim-lspconfig"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("cores.treesitter")
    end
  },
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
  },
  {
    "github/copilot.vim",
    config = function()
        vim.cmd [[
            let g:copilot_no_tab_map = v:true 
        ]]
    end
  },
  {
    "mg979/vim-visual-multi"
  },
  {
    "liuchengxu/vista.vim",
    config = function() 
      require "cores.vista"
    end
  }
}
