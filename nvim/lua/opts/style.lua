----- TOKYNIGHT CONFIG ------------
require('tokyonight').setup({
    style = 'moon',
    terminal_colors = true,
    transparent = false,
    styles = {sidebars = 'transparent'}
})

vim.cmd [[
    syntax enable
    if has('termguicolors')
      set termguicolors
    endif
]]

-- Default options:
require('kanagawa').setup({
    compile = true,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

require('kanagawa').load("wave")

-- SCHEME
vim.cmd [[
    let g:gruvbox_material_enable_bold=0
    let g:gruvbox_material_enable_italic=1
    let g:gruvbox_material_palette = 'original'
    let g:gruvbox_material_background = 'medium'
]]


-- vim.api.nvim_set_hl(0, 'Normal', {ctermbg = NONE, bg = NONE, fg = NONE})
vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg = 0, bg = transparent, fg = transparent })
vim.api.nvim_set_hl(0, 'cursorlinenr',
                    {ctermbg = bold, bg = transparent, fg = '#eef5e6'})
