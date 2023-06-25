vim.cmd([[
    syntax enable
    if has('termguicolors')
      set termguicolors
    endif
]])

vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = 0, bg = transparent, fg = transparent })
vim.api.nvim_set_hl(0, "cursorlinenr", { ctermbg = bold, bg = transparent, fg = "#03fc0f" })
