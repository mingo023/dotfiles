vim.cmd([[
    syntax on
    if has('termguicolors')
      set termguicolors
    endif
]])

-- vim.cmd("let g:gruvbox_material_foreground='mix'")
-- vim.cmd("let g:gruvbox_material_background = 'medium'")

vim.cmd.colorscheme("catppuccin-mocha")

vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = 0, bg = transparent, fg = transparent })

-- config for vim-dadbod-ui
vim.api.nvim_set_hl(0, "NotificationInfo", { ctermbg = 0, bg = transparent, fg = transparent })
vim.api.nvim_set_hl(0, "NotificationWarning", { ctermbg = 0, bg = transparent, fg = transparent })
vim.api.nvim_set_hl(0, "NotificationError", { ctermbg = 0, bg = transparent, fg = transparent })

-- vim.api.nvim_set_hl(0, "cursorlinenr", { ctermbg = bold, bg = transparent, fg = "#03fc0f" })

vim.api.nvim_set_hl(0, "FlashLabel", { ctermbg = 0, bg = "#ff0022", fg="#fcfcfc" })
