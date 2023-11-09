return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    dependencies = "nvim-lspconfig",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("cores.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context"
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("cores.lspsaga")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "github/copilot.vim",
    config = function()
      vim.cmd([[
            let g:copilot_no_tab_map = v:true 
        ]])
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "tpope/vim-rails",
  },
  -- {
  --   "liuchengxu/vista.vim",
  --   config = function()
  --     require("cores.vista")
  --   end,
  -- },
  {
    "uarun/vim-protobuf",
  },
}
