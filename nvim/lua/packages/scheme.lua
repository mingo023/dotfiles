return {
  {
    "norcalli/nvim-colorizer.lua",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("cores.theme.catppuccin")
    end,
  },
}
