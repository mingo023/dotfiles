local map = require("utils.mapping")

map("i", "jj", "<ESC>", { silent = true })

-- enable copy to clipboard
map("v", "<C-c>", '"+y')

-- remove matchings map("n", "<Leader>dm", ":noh <CR>", { silent = true })
map("n", "<Leader>dm", ":noh <CR>", { silent = true })

-- search all the words match with current selection
map("v", "/", 'y/<C-R>"<CR>N', { silent = true })

-- mapping for shift multiple lines repeatedly
map("v", "<", "<gv", { silent = silent })
map("v", ">", ">gv", { silent = silent })

map("n", "<Leader>jt", ":RunJestFocused <CR>")

map("n", "<Leader>ff", ":EslintFixAll <CR>", {
  silent = true,
})
map("n", "<C-s>", ":w <CR>")
map("v", ":", ":s/")

map("x", "p", "pgvye")

-- remap :w to <cmd+s> (check at: ~/.config/alacritty/alacritty.yml:705)
-- map("c", "w<CR>", 'echo "🚨 use <cmd+s> instead"<CR>')

map("n", "<A-Left>", ":vertical resize +5<CR>")
map("n", "<A-Right>", ":vertical resize -5<CR>")
map("n", "<A-Up>", ":resize +5<CR>")
map("n", "<A-Down>", ":resize -5<CR>")

-- quick save and quit
map("n", "<C-q>", ":qa! <CR>")
map("i", "<C-q>", "<Esc>:qa! <CR>")

-- move cursor line in multi-line format
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")

-- replace under cursor word
map("n", "<Leader>r", ":%s/\\<<C-r><C-w>\\>/")

-- move and center the cursor
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-i>", "<C-i>zz")
map("n", "<C-o>", "<C-o>zz")

-- convert snakecase to camelcase
vim.keymap.set("n", ",ct", function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local word = vim.fn.expand("<cword>")
  local word_start = vim.fn.matchstrpos(vim.fn.getline("."), "\\k*\\%" .. (col + 1) .. "c\\k*")[2]

  -- Detect camelCase
  if word:find("[a-z][A-Z]") then
    -- Convert camelCase to snake_case
    local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
  -- Detect snake_case
  elseif word:find("_[a-z]") then
    -- Convert snake_case to camelCase
    local camel_case_word = word:gsub("(_)([a-z])", function(_, l)
      return l:upper()
    end)
    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
  else
    print("Not a snake_case or camelCase word")
  end
end, { silent = true, desc = "switch case" })

-- split window
map("n", ",sp", ":split <CR>", {
  desc = "split window",
})
map("n", ",vs", ":vsplit <CR>", {
  desc = "vertical split window",
})
