local map = vim.keymap.set
local telescope_builtin = require("telescope.builtin")

map("n", "<Leader>fb", function()
  telescope_builtin.buffers({
    show_all_buffers = true,
    sort_lastused = true,
    ignore_current_buffer = true,
  })
end, { silent = true })

map("n", "<C-p>", function()
  telescope_builtin.find_files({
    find_command = {
      "fd",
      "--type",
      "f",
      "--follow",
    },
  })
end, { silent = true })

map("n", "<Leader>fg", function()
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

map("", ",g", ":Telescope git_status <CR>", { silent = true })

function relative_paths()
  local opts = {}
  opts.cwd = vim.fn.expand("%:p:h")
  require("telescope.builtin").find_files(opts)
end

map("n", ",e", relative_paths, { silent = true })
