local opt = vim.opt

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.autoread = true
opt.splitbelow = false
opt.splitright = true
opt.cul = true
opt.mouse = "a"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"
opt.fillchars = {
    eob = "x"
}

-- STATUSLINE
opt.laststatus = 3

-- MAXIMUM OF SUGGESTIONS LIST
opt.pumheight = 20

-- CURSOR
-- opt.gcr = 'a:blinkon0'

-- SWAPFILE
vim.g.noswapfile = true
vim.g.nobackup = true
opt.shortmess:append "A"

-- NUMBERS
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- INDENLINE
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

-- DISABLE BUILTIN VIM PLUGINS
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_spec = 0

vim.cmd[[
    syntax enable
    if has('termguicolors')
      set termguicolors
    endif
]]

-- Vim-illuminate
vim.cmd[[
    let g:Illuminate_ftblacklist = ['NvimTree']
]]

-- NAVIC
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"




vim.cmd[[
    highlight SignColumn guibg=transparent
]]


-- SCHEME
vim.cmd[[
    let g:gruvbox_material_enable_bold=0
    let g:gruvbox_material_enable_italic=1
    let g:gruvbox_material_palette = 'original'
    let g:gruvbox_material_background = 'medium'

    set background=dark
    colorscheme nightfox
]]

-- vim.cmd "hi cursorlinenr cterm=bold guifg=yellow guibg=transparent"
