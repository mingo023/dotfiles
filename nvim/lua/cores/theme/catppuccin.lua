require("catppuccin").setup({
  background = {
    light = "latte",
    dark = "mocha",
  },
  color_overrides = {
    -- mocha = require("cores.theme.schemes.gruvbox-material"),
    mocha = {
      base = "#181818",
    },
  },
  styles = {
    comments = {},
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
      FloatBorder = { bg = colors.none, fg = colors.green },
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
