return {
  {
    "windwp/nvim-autopairs",
    dependencies = "nvim-cmp",
    config = function()
        require("cores.auto-pair")
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("cores.indent")
    end
  },
  {
    'b3nj5m1n/kommentary',
    config = function()
        require('kommentary.config').configure_language("default", {
            prefer_single_line_comments = true
        })
    end
  },
  {
    "mhartington/formatter.nvim",
    config = function()
        require("cores.formatter")
    end
  },
  {
    "tpope/vim-surround"
  },
  {
    "kamykn/spelunker.vim"
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("cores.spectre")
    end
  }
}
