local opt = vim.opt

vim.g.dark_mode = true
vim.g.auto_format = true

-- Mise Integration
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore:append({ "*.o", "*~", "*.pyc", "*pycache*" })
opt.wildignore:append({ "Cargo.lock", "Cargo.Bazel.lock" })

-- Cool floating window popup menu for completion on command line
opt.pumblend = 0
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
opt.termguicolors = true
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = false -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = false -- Prefer windows splitting to the top
opt.updatetime = 2430 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
opt.laststatus = 3 -- Always display the status line
opt.list = true -- Show some invisible characters (tabs...)
opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = ">",
  precedes = "<",
  nbsp = "␣",
  conceal = "┊",
}

-- Cursorline highlighting control
--  Only have it on in the active buffer
opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = false -- Living on the edge
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.mouse = "a"

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "hiddenoff",
  "algorithm:minimal",
}

vim.opt.undofile = true
vim.opt.signcolumn = "yes:1"

-- SPELL
vim.api.nvim_command("set nospell")

-- UNDOFILE
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- DISABLE BUILTIN VIM PLUGINS
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_spec = 0

-- RUST
vim.g.rust_recommended_style = 0

-- Golang
vim.cmd([[
autocmd BufEnter *.go setlocal
    \ tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 noexpandtab
    \ cindent cinoptions=:0,l1,t0,g0,(0,W8
    \ filetype=go
]])

-- PHP
vim.cmd([[
autocmd BufEnter *.php setlocal
    \ shiftwidth=4
    \ filetype=php
]])

-- LSP
vim.g.auto_format = true

-- Grep
vim.cmd("set grepprg=rg\\ --vimgrep\\ --smart-case\\ --follow")

-- Winbar
-- vim.api.nvim_command("set winbar=%m\\ %f")

-- plantuml
vim.cmd([[
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)
  ]])

-- Draw Performance
vim.cmd([[
  set ttyfast
  set synmaxcol=256
  syntax sync minlines=256

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
]])

-- Spell Check
vim.cmd([[au FileType lua setlocal nospell]]) -- disable spell check for lua files

-- DISABLE AUTO COMMENT ON INSERT
-- use VimEnter to avoid autocmd conflict by other plugins
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
