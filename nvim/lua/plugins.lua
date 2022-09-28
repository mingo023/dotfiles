local use = require("packer").use

vim.cmd [[packadd packer.nvim]]
return require("packer").startup{
  function()
    use 'wbthomason/packer.nvim'
    require("packages.cmp")
    require("packages.lang")
    require("packages.format")
    require("packages.scheme")
    require("packages.tree")
    require("packages.bufferline")
    require("packages.statusline")
    require("packages.telescope")
    require("packages.git")
    require("packages.utils")
    require("packages.movement")
    require("packages.testing")
  end,
  config = {
    display = {
      -- open_fn = function()
      --   return require("packer.util").float({border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}})
      -- end,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      moved_sym = ""
    }
  }
}
