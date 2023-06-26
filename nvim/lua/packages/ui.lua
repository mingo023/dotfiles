return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "dots_ellipsis"
        },
        window = {
          blend = 0,
          relative = "editor",
        }
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 1,
        },
      })
    end,
  },
  {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("cores.silicon")
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "ColorScheme",
    config = function()
      require("cores.notify")
    end,
  },
}
