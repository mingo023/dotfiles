local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.sources.telescope")

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
    selection_caret = " ❯ ",
    prompt_prefix = " 👀 ",
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    winblend = 0,
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    initial_mode = "insert",
    results_title = false,
    border = true,
    borderchars = {
      prompt = { " ", " ", "─", " ", " ", " ", "─", "─" },
      results = { "─", " ", " ", " ", "─", "─", " ", " " },
      preview = { "─", " ", "─", "│", "┬", "─", "─", "╰" },
    },
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 0.43,
      preview_width = 0.68,
      prompt_position = "bottom",
    },
    mappings = {
      i = {
        ["<C-d>"] = actions.close,
        ["<Esc>"] = actions.close,
        -- ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-b>"] = actions.preview_scrolling_up,
        -- ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-s>"] = actions.select_vertical,
        ["<C-i>"] = actions.select_horizontal,
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
