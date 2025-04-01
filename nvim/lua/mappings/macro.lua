local map = require("utils.mapping")

local opts = { noremap = true, silent = true }

map("n", "<leader>q", "@q", opts)
map("v", "<leader>q", ":%norm! @q<CR>", opts)

vim.api.nvim_create_user_command("EditMacro", function()
  local macroContent = vim.fn.getreg("q")

  local inputConfig = {
    prompt = 'Edit Macro ["q"]:',
    default = macroContent,
  }

  vim.ui.input(inputConfig, function(macro)
    if not macro then
      return
    end -- handle escape

    -- add escape to end of macro
    macro = macro .. ""

    vim.fn.setreg("q", macro)
  end)
end, { nargs = "*" })

vim.api.nvim_create_augroup("TSMacro", { clear = true })
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
vim.api.nvim_create_autocmd("FileType", {
  group = "TSMacro",
  pattern = { "typescript", "typescriptreact", "typescript.tsx" },
  callback = function()
    vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa: '" .. esc .. "a, " .. esc .. "pa);" .. esc)
    map("v", "<leader>l", "@l", opts)
  end,
})
