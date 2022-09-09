local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = {{
            filetype = "NvimTree",
            text = "",
            padding = 1
        }},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        indicator = {
            style = 'icon',
            icon = '|',
        },
        max_name_length = 14,
        close_command = "Bclose!",
        max_prefix_length = 13,
        tab_size = 24,
        show_tab_indicators = true,
        -- enforce_regular_tabs = true,
        diagnostics = "nvim_lsp",
        -- view = "multiwindow",
        show_buffer_close_icons = true,
        -- separator_style = "slant",
        always_show_bufferline = true
    }
}
