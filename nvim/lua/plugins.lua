local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local use = require("packer").use

return require("packer").startup{
  function()
    use 'wbthomason/packer.nvim'
    if packer_bootstrap then
        require('packer').sync()
    end

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
    require("packages.term")
    require("packages.winbar")
    require("packages.ui")
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
