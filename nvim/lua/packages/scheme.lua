return {
  {
    "sainnhe/gruvbox-material",
  },
  {
    "folke/tokyonight.nvim",
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("cores.theme")
    end,
  },
}
