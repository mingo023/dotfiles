return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {{'nvim-lua/plenary.nvim'}},
    config = function() require("cores.telescope") end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  }
}
