local map = vim.keymap.set

map("n", "<leader>zg", function()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return
  end

  local cwd = vim.fn.expand("$HOME") .. "/.config"
  local path =  cwd .. "/nvim/spell/cspell.json"
  local script_path = cwd .. "/nvim/js/add_word_to_cspell.js"
  local command = "node " .. script_path .. " " .. path .. " " .. word

  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()

  vim.cmd("checktime")
  vim.notify("!!!Added " .. word)
end, { noremap = true, silent = true })
