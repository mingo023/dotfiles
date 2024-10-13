local map = vim.keymap.set

local harpoon = require("harpoon")

map("n", "<Leader>ha", function()
  harpoon:list():add()
end, { noremap = true, silent = true })

map("n", "<Leader>hm", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true, silent = true })

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

map("n", "<Leader>ht", function()
  toggle_telescope(harpoon:list())
end, { noremap = true, silent = true })
