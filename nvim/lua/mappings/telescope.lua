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
    hidden = true,
    previewer = true,
    find_command = {
      "fd",
      "--type",
      "file",
      "--type",
      "symlink",
      "--hidden",
      "--exclude",
      ".git",
    },
  })
end, { silent = true })

vim.cmd("command! NvimConfig lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })")

map("n", "<Leader>ma", ":Telescope marks <CR>", { silent = true })
map("n", "<Leader>sp", ":Namu symbols <CR>", { silent = true })

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
