require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript" },


  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
