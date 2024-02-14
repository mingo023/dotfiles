vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "mix"

-- this is enabled for spell checker
vim.g.gruvbox_material_better_performance = 1

vim.cmd("colorscheme gruvbox-material")

local colors = {
  bg = "#1D2021",
  fg = "#EBDBB2",
  green = "#a9b665",
  purple = "#C792EA",
}

local nvim_set_hl = vim.api.nvim_set_hl

nvim_set_hl(0, "FloatBorder", { bg = colors.bg, fg = colors.fg })
nvim_set_hl(0, "CursorLineNr", { fg = colors.green })
nvim_set_hl(0, "CmpItemMenu", { fg = colors.purple, bg = "NONE", italic = true })
