local merge = require("utils.merge")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
local cmp_pkg = require("packages.cmp")
local format_pkg = require("packages.format")
local tree_pkg = require("packages.tree")
local statusline_pkg = require("packages.statusline")
local telescope_pkg = require("packages.telescope")
local git_pkg = require("packages.git")
local utils_pkg = require("packages.utils")
local movement_pkg = require("packages.movement")
local testing_pkg = require("packages.testing")
local ui_pkg = require("packages.ui")
local bufferline_pkg = require("packages.bufferline")
local db_pkg = require("packages.db")
local ai_pkg = require("packages.ai")

local plugins = merge(
  scheme_pkg,
  testing_pkg,
  lang_pkg,
  cmp_pkg,
  format_pkg,
  tree_pkg,
  statusline_pkg,
  telescope_pkg,
  git_pkg,
  utils_pkg,
  movement_pkg,
  ui_pkg,
  bufferline_pkg,
  db_pkg,
  ai_pkg
)

require("lazy").setup({
  spec = plugins,
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  dev = { path = "~/.ghq/github.com" },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip", -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})
