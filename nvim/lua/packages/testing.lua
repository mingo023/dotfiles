local packer = require "packer"
local use = packer.use

use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest"
  },
  config = function()
    require("cores.testing")
  end
}
