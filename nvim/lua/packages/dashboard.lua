return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("cores.dashboard")
    end,
  },
}
