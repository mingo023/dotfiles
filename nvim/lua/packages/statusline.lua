return {
  {
    "rebelot/heirline.nvim",
    event = "UiEnter",
    config = function()
      require("cores.statusline")
    end,
  },
}
