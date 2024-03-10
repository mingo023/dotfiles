local map = vim.api.nvim_set_keymap

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
