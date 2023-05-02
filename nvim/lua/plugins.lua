-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end

-- local packer_bootstrap = ensure_packer()
-- local use = require("packer").use

-- return require("packer").startup{
--   function()
--     use 'wbthomason/packer.nvim'
--     if packer_bootstrap then
--         require('packer').sync()
--     end

--   end,
--   config = {
--     display = {
--       open_fn = function()
--         return require("packer.util").float({border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}})
--       end,
--       working_sym = "",
--       error_sym = "",
--       done_sym = "",
--       moved_sym = ""
--     }
--   }
-- }

local merge = require("utils.merge")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local scheme_pkg = require("packages.scheme")
local lang_pkg = require("packages.lang")
local bufferline_pkg = require("packages.bufferline")
local cmp_pkg = require("packages.cmp")
local format_pkg = require("packages.format")
local winbar_pkg = require("packages.winbar")
local tree_pkg = require("packages.tree")
local statusline_pkg = require("packages.statusline")
local telescope_pkg = require("packages.telescope")
local git_pkg = require("packages.git")
local utils_pkg = require("packages.utils")
local movement_pkg = require("packages.movement")
local testing_pkg = require("packages.testing")
local term_pkg = require("packages.term")
local ui_pkg = require("packages.ui")

local plugins = merge(
  scheme_pkg,
  lang_pkg,
  bufferline_pkg,
  cmp_pkg,
  format_pkg,
  winbar_pkg,
  tree_pkg,
  statusline_pkg,
  telescope_pkg,
  git_pkg,
  utils_pkg,
  movement_pkg,
  testing_pkg,
  term_pkg,
  ui_pkg
)

require("lazy").setup(plugins)

