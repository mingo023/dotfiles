local colors = require("colors").get()

local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

bufferline.setup {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      indicator_icon = '▎',
      max_name_length = 14,
      close_command = "Bclose!",
      max_prefix_length = 13,
      tab_size = 24,
      show_tab_indicators = true,
      -- enforce_regular_tabs = true,
      diagnostics = "nvim_lsp",
      -- view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "slant",
      always_show_bufferline = true,
   },
   highlights = {
      background = {
         guifg = colors.grey_fg,
         guibg = colors.black2,
      },
      modified = {
         guifg = colors.red,
         guibg = colors.black2,
      },
      modified_visible = {
         guifg = colors.red,
         guibg = colors.black2,
      },
      modified_selected = {
         guifg = colors.green,
         guibg = colors.black,
      },
      tab = {
         guifg = colors.light_grey,
         guibg = colors.one_bg3,
      },
      tab_selected = {
         guifg = colors.black2,
         guibg = colors.nord_blue,
      },
      tab_close = {
         guifg = colors.red,
         guibg = colors.black,
      },
      error_diagnostic_visible = {
        guifg = colors.red,
      },
      error_diagnostic = {
        guifg = colors.red,
      },
      error_visible = {
        guifg = colors.red
      },
      warning_diagnostic_visible = {
        guifg = colors.yellow,
      },
      warning_diagnostic = {
        guifg = colors.yellow,
      },
      warning_visible = {
        guifg = colors.yellow
      },
   },
}
