local present, gitsigns = pcall(require, "gitsigns")
if not present then
    return
end

gitsigns.setup {
    keymaps = {
        -- Default keymap options
        buffer = true,
        noremap = true, ["n ]c"] = {
            expr = true,
            "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"
        },
        ["n [c"] = {
            expr = true,
            "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"
        },
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    sign_priority = 5,
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAdd'},
        change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChange'},
        delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDelete'},
        topdelete    = {hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDelete'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChange'},
    },
    status_formatter = nil, -- Use default
    watch_gitdir = {
        interval = 100
    }
}

vim.api.nvim_set_hl(0, 'GitSignsAdd', {ctermbg=0, bg=transparent, fg="#69FF94"})
vim.api.nvim_set_hl(0, 'GitSignsChange', {ctermbg=0, bg=transparent, fg="#E5C07B"})
vim.api.nvim_set_hl(0, 'GitSignsDelete', {ctermbg=0, bg=transparent, fg="#E06C75"})
