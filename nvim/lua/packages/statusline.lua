local packer = require "packer"
local use = packer.use

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
      require("cores.statusline")
  end
}
