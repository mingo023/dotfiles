local g = vim.g

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
    icons = { hint = " ", info = " ", warning = " ", error = " " },
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
        folder = {
          default = "",
          open = "",
          empty_open = "",
          empty = "",
          symlink = "",
        },
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
