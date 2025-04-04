local high_contrast_theme = {
  rosewater = "#F5B8AB",
  flamingo = "#F29D9D",
  pink = "#AD6FF7",
  mauve = "#FF8F40",
  red = "#E66767",
  maroon = "#EB788B",
  peach = "#FAB770",
  yellow = "#FACA64",
  green = "#70CF67",
  teal = "#4CD4BD",
  sky = "#61BDFF",
  sapphire = "#4BA8FA",
  blue = "#00BFFF",
  lavender = "#00BBCC",
  text = "#C1C9E6",
  subtext1 = "#A3AAC2",
  subtext0 = "#8E94AB",
  overlay2 = "#7D8296",
  overlay1 = "#676B80",
  overlay0 = "#464957",
  surface2 = "#3A3D4A",
  surface1 = "#2F313D",
  surface0 = "#1D1E29",
  base = "#181819",
  mantle = "#11111a",
  crust = "#191926",
}

local gruvbox_theme = {
  rosewater = "#FB4834",
  flamingo = "#FB4834",
  red = "#FB4834",
  maroon = "#FB4834",
  pink = "#d3859b",
  mauve = "#d3859b",
  peach = "#e78a4e",
  yellow = "#FBBD2E",
  green = "#8dc07c",
  teal = "#B9BB25",
  sky = "#99c792",
  sapphire = "#99c792",
  blue = "#8dbba3",
  lavender = "#8dbba3",
  text = "#f1e4c2",
  subtext2 = "#c5b4a1",
  subtext1 = "#d5c4a1",
  subtext0 = "#bdae93",
  overlay2 = "#a89984",
  overlay1 = "#928374",
  overlay0 = "#595959",
  surface2 = "#4d4d4d",
  surface1 = "#404040",
  surface0 = "#292929",
  base = "#1d2224",
  mantle = "#1d2224",
  crust = "#1f2223",
}

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
  overlay2 = "#a89984",
  overlay1 = "#928374",
  overlay0 = "#595959",
  surface2 = "#4d4d4d",
  surface1 = "#404040",
  surface0 = "#292929",
  base = "#181818",
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
    mocha = ming_scheme,
  },
  styles = {
    comments = { "italic" },
    conditionals = {},
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
      NvimTreeNormal = { bg = colors.none },
      -- NvimTree

      WinSeparator = { bg = colors.none, fg = colors.surface0 },

      -- LSP Saga
      SagaFinderFname = { fg = colors.rosewater },
      -- LSP Saga

      -- Cmp
      CmpItemMenu = { fg = colors.surface2 },
      -- Cmp

      CursorLineNr = { fg = colors.text, style = { "bold" } },
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

      SignColumn = { bg = colors.none, fg = colors.base },

      -- Telescope configuration
      TelescopePromptTitle = { fg = colors.mantle, bg = colors.green, style = { "bold" } },
      TelescopePromptCounter = { fg = colors.red, style = { "bold" } },
      TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      -- Telescope results
      TelescopeResultsTitle = { fg = colors.mantle, bg = colors.sky },
      TelescopeResultsBorder = { link = "TelescopePromptBorder" },
      -- Telescope preview
      TelescopePreviewTitle = { fg = colors.mantle, bg = colors.rosewater },
      TelescopePreviewBorder = { link = "TelescopePromptBorder" },

      TelescopeBorder = { bg = colors.surface0, fg = colors.base },
      TelescopeNormal = { bg = colors.surface0 },

      -- NvimTreeFolderName = { fg = colors.sapphire },
      -- NvimTreeOpenedFolderName = { fg = colors.sapphire },
      -- NvimTreeFolderIcon = { fg = colors.sapphire },
    }
  end,
})

vim.cmd.colorscheme("catppuccin-mocha")
