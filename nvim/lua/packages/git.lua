return {
  {
    "lewis6991/gitsigns.nvim",
    version = "1.0.2",
    config = function()
      require("cores.gitsigns")
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup({
        highlights = {
          incoming = "DiffAdd",
          current = "DiffChange",
        },
      })
    end,
  },
}
