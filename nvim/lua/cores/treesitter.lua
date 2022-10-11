require'nvim-treesitter.configs'.setup {
    ensure_installed = {"typescript", "go"},
    highlight = {enable = true, additional_vim_regex_highlighting = true}
}
