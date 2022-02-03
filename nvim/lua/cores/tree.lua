local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
    return
end

local tree_cb = tree_c.nvim_tree_callback
local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1

-- g.nvim_tree_ignore = { ".git", "node_modules", ".cache", ".DS_Store" }

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = false,
    open_on_tab = false,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
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
    files = {
        dotfiles = true,
        custom = { ".git", "node_modules", ".cache", ".DS_Store" }
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

    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = true,
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
