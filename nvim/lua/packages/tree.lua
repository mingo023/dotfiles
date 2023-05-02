return {
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("cores.tree")
    end
  }
}
