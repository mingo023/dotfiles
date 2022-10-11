vim.cmd[[
    syntax enable
    if has('termguicolors')
      set termguicolors
    endif
]]

-- WINBAR
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- SCHEME
vim.cmd[[
    let g:gruvbox_material_enable_bold=0
    let g:gruvbox_material_enable_italic=1
    let g:gruvbox_material_palette = 'original'
    let g:gruvbox_material_background = 'medium'
]]

vim.cmd("colorscheme tokyonight-moon")

vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg=0, bg=transparent})
vim.api.nvim_set_hl(0, 'cursorlinenr', {ctermbg=bold, bg=transparent, fg=yellow})

