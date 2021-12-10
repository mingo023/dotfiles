local packer = require "packer"
local use = packer.use

use {
  "neovim/nvim-lspconfig",
  config = function()
    require "lsp"
  end,
}
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
}
use {
  "kabouzeid/nvim-lspinstall",
  event = "BufRead"
}
use {
  "tami5/lspsaga.nvim"
}
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  commit = "780c395",
}
use {
  "github/copilot.vim"
}

use {
  "windwp/nvim-ts-autotag",
  config = function()
    require'nvim-treesitter.configs'.setup {
      autotag = {
        enable = true,
      }
    }
  end
}

