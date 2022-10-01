local packer = require "packer"
local use = packer.use

use {"akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({})
      require("cores.lazygit")
      require("cores.term")
    end
}
