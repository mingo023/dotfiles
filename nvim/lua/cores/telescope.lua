local actions = require 'telescope.actions'
local trouble = require 'trouble.providers.telescope'

require("telescope").setup {
    defaults = {
        prompt_prefix = "   ",
        selection_caret = " ❯ ",
        entry_prefix = "   ",
        sorting_strategy = 'ascending',
        winblend = 0,
        hidden = true,
        -- preview = false,
        file_ignore_patterns = {"node_modules"},
        mappings = {
            i = {
                ["<C-d>"] = actions.close,
                ["<Esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-b>"] = actions.preview_scrolling_up,
                -- ["<C-f>"] = actions.preview_scrolling_down,
                ["<C-s>"] = actions.select_vertical,
                ["<C-i>"] = actions.select_horizontal,
                -- ["<C-t>"] = trouble.open_with_trouble
            },
            n = {
                ["<C-d>"] = actions.close,
                ["<Esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-b>"] = actions.preview_scrolling_up,
                -- ["<C-f>"] = actions.preview_scrolling_down,
                ["<C-s>"] = actions.select_vertical,
                ["<C-i>"] = actions.select_horizontal,
                -- ["<C-t>"] = trouble.open_with_trouble
            }
        },
        layout_config = {
            height = 0.5,
            width = 0.6
        },
        initial_mode = "insert",
        layout_strategy = "horizontal",
    }
}
