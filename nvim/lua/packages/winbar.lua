return {
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
        require("cores.winbar")
    end
  }
}
