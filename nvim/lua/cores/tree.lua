local g = vim.g
local icons = require("cores.icons").diagnostics
local tree_icons = require("cores.icons").tree

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = false,
  actions = {
    open_file = {
      window_picker = {
        enable = true,
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.Hint,
      info = icons.Info,
      warning = icons.Warn,
      error = icons.Error,
    },
  },
  hijack_directories = { enable = true, auto_open = true },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store", "^.git$" },
    exclude = { "dist", ".env" },
  },
  update_focused_file = { enable = true, update_cwd = false, ignore_list = {} },
  system_open = { cmd = nil, args = {} },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "╰┈",
        edge = "│",
        item = "│",
        bottom = "",
        none = "",
      },
    },
    highlight_git = true,
    icons = {
      show = {
        folder_arrow = false,
      },
      glyphs = {
        git = {
          untracked = "✦",
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          deleted = "",
          ignored = "",
        },
        folder = tree_icons.folder,
      },
    },
  },
  git = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    side = "left",
    float = {
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        row = 1,
        col = 1,
      },
    },
  },
})
