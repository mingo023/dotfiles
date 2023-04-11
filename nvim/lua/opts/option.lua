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
opt.relativenumber = false
opt.numberwidth = 2

-- INDENLINE
opt.expandtab = true
opt.shiftwidth = 2
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

-- DISABLE AUTO COMMENT ON INSERT
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*"},
    command = "setlocal formatoptions-=cro"
})
