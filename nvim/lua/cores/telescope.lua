local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.sources.telescope")
local sorter = require("telescope.sorters")

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      ".git/",
      "%.o",
      "%.a",
      "%.out",
      "%.class",
      "%.pdf",
      "%.mkv",
      "%.mp4",
      "%.zip",
      "coverage%-report/.*",
      "src/public/vendor/nova",
      "karabiner",
      "**/vendor/*",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    selection_caret = "╰┈➤ ",
    prompt_prefix = "(づ ̄ ³ ̄)づ",
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    file_sorter = sorter.get_fzy_sorter,
    winblend = 0,
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    initial_mode = "insert",
    border = true,
    preview = {
      hide_on_startup = true,
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.65,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.68,
      height = 0.3,
      preview_cutoff = 120,
    },
    mappings = {
      i = {
        ["<C-q>"] = actions.close,
        ["<C-d>"] = actions.close,
        ["<Esc>"] = actions.close,
        -- ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-s>"] = actions.select_vertical,
        ["<C-i>"] = actions.select_horizontal,
        ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-t>"] = trouble.open,
      },
      n = {
        ["<C-d>"] = actions.close,
        ["<Esc>"] = actions.close,
        -- ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-b>"] = actions.preview_scrolling_up,
        -- ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-s>"] = actions.select_vertical,
        ["<C-i>"] = actions.select_horizontal,
        -- ["<C-t>"] = trouble.open
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

require("telescope").load_extension("fzf")
