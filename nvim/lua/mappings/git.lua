local map = require("utils.mapping")
local opts = { silent = true }

map("n", "<Leader>gg", ":Git<CR>:16wincmd_<CR>")
map("n", "<Leader>gb", ":Git blame <CR>")
map("n", "<Leader>gw", ":Gwrite <CR>")
map("n", "<Leader>gdd", ":Gvdiffsplit <CR>")
map("n", "<Leader>co", ":diffget //2 <CR>")
map("n", "<Leader>ct", ":diffget //3 <CR>")

-- Git conflict

-- Open merge tool
local open_merge_tool = function()
  vim.cmd("Gvdiffsplit!")
  vim.cmd("LspStop")
end
vim.keymap.set("n", "gmo", open_merge_tool, opts)

-- Completed Merge and stage a file
-- Notes: When finish merge, we need to reactive LSP
local completed_merge = function()
  vim.cmd("silent! only!")
  vim.cmd("silent! Gitsigns stage_buffer")
  vim.cmd("LspStart")
end

vim.keymap.set("n", "gmc", completed_merge, opts)

-- Navigate to next/previous conflict
local jump_to_next_conflict = function() vim.cmd("/<<<<<<<") end
vim.keymap.set("n", "]x", jump_to_next_conflict, opts)

local jump_to_previous_conflict = function() vim.cmd("silent! ?<<<<<<<") end
vim.keymap.set("n", "[x", jump_to_previous_conflict, opts)
