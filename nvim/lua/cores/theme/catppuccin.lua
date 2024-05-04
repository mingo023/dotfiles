local ming_scheme = {
  rosewater = "#ea6962",
  flamingo = "#ea6962",
  red = "#ea6962",
  maroon = "#ea6962",
  pink = "#d3869b",
  mauve = "#d3869b",
  peach = "#e78a4e",
  yellow = "#d8a657",
  green = "#a9b665",
  teal = "#89b482",
  sky = "#89b482",
  sapphire = "#89b482",
  blue = "#7daea3",
  lavender = "#7daea3",
  text = "#ebdbb2",
  subtext1 = "#d5c4a1",
  subtext0 = "#bdae93",
  overlay2 = "#a89984",
  overlay1 = "#928374",
  overlay0 = "#595959",
  surface2 = "#4d4d4d",
  surface1 = "#404040",
  surface0 = "#292929",
  base = "#181818",
  mantle = "#191b1c",
  crust = "#141617",
  none = "NONE",
}

local louis_scheme = {
  rosewater = "#fed1cb",
  flamingo = "#ff9185",
  pink = "#d699b6",
  mauve = "#cb7ec8",
  red = "#e06062",
  maroon = "#e67e80",
  peach = "#e69875",
  yellow = "#d3ad63",
  green = "#b0cc76",
  teal = "#6db57f",
  sky = "#8fbbb3",
  sapphire = "#60aaa0",
  blue = "#59a6c3",
  lavender = "#e0d3d4",
  text = "#e8e1bf",
  subtext1 = "#e0d7c3",
  subtext0 = "#d3c6aa",
  overlay2 = "#9da9a0",
  overlay1 = "#859289",
  overlay0 = "#6d6649",
  surface2 = "#585c4a",
  surface1 = "#414b50",
  surface0 = "#374145",
  base = "#1C1C20",
  mantle = "#161b1d",
  crust = "#14181a",
  none = "NONE",
}

require("catppuccin").setup({
  background = {
    light = "latte",
    dark = "mocha",
  },
  color_overrides = {
    mocha = louis_scheme,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "bold" },
    functions = { "bold" },
    keywords = { "bold" },
    strings = {},
    variables = {},
    numbers = { "bold" },
    booleans = { "bold" },
    properties = {},
    types = { "bold" },
    operators = {},
  },
  integrations = {
    lsp_saga = true,
  },
  transparent_background = true,
  show_end_of_buffer = false,
  custom_highlights = function(colors)
    return {
      -- Flash.nvim
      FlashMatch = { bg = colors.base, fg = colors.teal },
      FlashLabel = { bg = colors.base, fg = colors.teal },
      -- Flash.nvim

      -- NvimTree
      NvimTreeStatuslineNc = { bg = colors.base, fg = colors.surface0 },
      NvimTreeWinSeparator = { bg = colors.none, fg = colors.surface0 },
      WinSeparator = { bg = colors.none, fg = colors.text },
      NvimTreeNormal = { bg = colors.none },
      -- NvimTree

      -- LSP Saga
      SagaFinderFname = { fg = colors.rosewater },
      -- LSP Saga

      CmpItemMenu = { fg = colors.surface2 },
      CursorLineNr = { fg = colors.green, style = { "bold" } },
      FloatBorder = { bg = colors.base, fg = colors.green },
      GitSignsChange = { fg = colors.peach },
      LineNr = { fg = colors.overlay0 },
      LspInfoBorder = { link = "FloatBorder" },
      NeoTreeDirectoryIcon = { fg = colors.subtext1 },
      NeoTreeDirectoryName = { fg = colors.subtext1 },
      NormalFloat = { bg = colors.none, fg = "#ffffff" },
      VertSplit = { bg = colors.base, fg = colors.surface0 },
      WhichKeyFloat = { bg = colors.crust },
      YankHighlight = { bg = colors.surface2 },
      FidgetTask = { fg = colors.subtext2 },
      FidgetTitle = { fg = colors.peach },

      IblIndent = { fg = colors.surface0 },
      IblScope = { fg = colors.overlay0 },

      Boolean = { fg = colors.mauve },
      Number = { fg = colors.mauve },
      Float = { fg = colors.mauve },

      PreProc = { fg = colors.mauve },
      PreCondit = { fg = colors.mauve },
      Include = { fg = colors.mauve },
      Define = { fg = colors.mauve },
      Conditional = { fg = colors.red },
      Repeat = { fg = colors.red },
      Keyword = { fg = colors.red },
      Typedef = { fg = colors.red },
      Exception = { fg = colors.red },
      Statement = { fg = colors.red },

      Error = { fg = colors.red },
      StorageClass = { fg = colors.peach },
      Tag = { fg = colors.peach },
      Label = { fg = colors.peach },
      Structure = { fg = colors.peach },
      Operator = { fg = colors.peach },
      Title = { fg = colors.peach },
      Special = { fg = colors.yellow },
      SpecialChar = { fg = colors.yellow },
      Type = { fg = colors.yellow, style = { "bold" } },
      Function = { fg = colors.green, style = { "bold" } },
      Delimiter = { fg = colors.subtext2 },
      Ignore = { fg = colors.subtext2 },
      Macro = { fg = colors.teal },

      NotificationInfo = { fg = colors.text },
      NotificationWarning = { fg = colors.text },
      NotificationError = { fg = colors.text },

      SignColumn = { bg = colors.base, fg = colors.base },
    }
  end,
})

vim.cmd.colorscheme("catppuccin-mocha")
