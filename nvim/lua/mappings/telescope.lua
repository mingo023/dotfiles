local map = vim.keymap.set
local telescope_builtin = require("telescope.builtin")

map("n", ",fb", function()
  telescope_builtin.buffers({
    show_all_buffers = true,
    sort_lastused = true,
    ignore_current_buffer = true,
  })
end, { silent = true })

map("n", "<C-p>", function()
  telescope_builtin.find_files({
    hidden = true,
    find_command = {
      "fd",
      "--type",
      "f",
      "--follow",
    },
  })
end, { silent = true })

map("n", ",fg", function()
  telescope_builtin.live_grep({
    find_command = { "rg", "--ignore", "--hidden", "--files" },
  })
end, { silent = true })

map("n", "<Leader>ma", ":Telescope marks <CR>", { silent = true })
map("n", "gr", ":Telescope lsp_references <CR>", { silent = true })
map("n", "<Leader>sp", function()
  return require("telescope.builtin").lsp_document_symbols({
    symbol_width = 50,
    symbols = {
      "Method",
    },
  })
end, { silent = true })

map("", ",gs", ":Telescope git_status <CR>", { silent = true })
map("", ",gb", ":Telescope git_branches <CR>", { silent = true })
map("", ",gt", ":Telescope git_stash <CR>", { silent = true })

function relative_paths()
  local opts = {}
  opts.cwd = vim.fn.expand("%:p:h")
  require("telescope.builtin").find_files(opts)
end

function relative_paths_in_nested()
  local opts = {
    hidden = true,
  }
  opts.cwd = vim.fn.expand("%:p:h:h")
  require("telescope.builtin").find_files(opts)
end

map("n", ",e", relative_paths, { silent = true })
map("n", ",,e", relative_paths_in_nested, { silent = true })

-- NESTJS MAPPINGS
-- menu for selecting controller - service - entity

function display_nestjs_file_structure_types_menu()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local sorters = require("telescope.sorters")

  local opts = {
    finder = finders.new_table({
      "controller",
      "service",
      "entity",
      "repository",
      "command",
    }),
    sorter = sorters.get_generic_fuzzy_sorter({}),
  }

  pickers
    .new(opts, {
      prompt_title = "NestJS File Structure Types",
      sorter = sorters.get_generic_fuzzy_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        local select_file_structure_type = function()
          local selection = require("telescope.actions.state").get_selected_entry()

          telescope_builtin.find_files({
            hidden = true,
            find_command = {
              "fd",
              "--type",
              "f",
              "--follow",
              "--glob",
              "*" .. selection.value .. ".ts",
            },
          })
        end

        map("i", "<CR>", select_file_structure_type)
        map("n", "<CR>", select_file_structure_type)

        return true
      end,
    })
    :find()
end

map("n", ",p", display_nestjs_file_structure_types_menu, { silent = true })
