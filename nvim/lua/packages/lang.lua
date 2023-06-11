return {
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
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        rename = {
          quit = "<C-c>",
          exec = "<CR>",
          mark = "x",
          confirm = "<CR>",
          in_select = false,
        },
      })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "williamboman/mason.nvim",
    config = function() 
      require("mason").setup() 
    end
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
