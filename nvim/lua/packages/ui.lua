return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "dots_ellipsis",
        },
        window = {
          blend = 0,
          relative = "editor",
        },
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 0.8,
        },
      })
    end,
  },
  {
    "narutoxy/silicon.lua",
    config = function()
      require("cores.silicon")
    end,
  },
  {
    "onsails/lspkind.nvim",
  },
}
