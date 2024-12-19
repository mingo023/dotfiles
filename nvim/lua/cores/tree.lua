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
    icons = { hint = "", info = "", warning = "", error = "" },
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
    indent_markers = { enable = true },
    highlight_git = true,
    icons = {
      glyphs = {
        git = {
          untracked = "✦",
        },
      },
    },
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

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },
  folder = {
    -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front of the default and opened folders below!
    arrow_open = "",
    arrow_closed = "",
    default = "",
    empty = "", -- 
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
}
