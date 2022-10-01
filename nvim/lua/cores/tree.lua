local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
    return
end

local g = vim.g

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    filters = {
        dotfiles = false,
        custom = { ".cache", ".DS_Store", "^.git$" },
        exclude = { "node_modules", "dist", ".env" }
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        highlight_git = true
    },
    view = {
        adaptive_size = true,
        side = 'left',
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}

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
        untracked = "★"
    },
    folder = {
        -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
        arrow_open = "",
        arrow_closed = "",
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = ""
    }
}
