return {
  {
    "mfussenegger/nvim-treehopper",
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation"
  },
}
