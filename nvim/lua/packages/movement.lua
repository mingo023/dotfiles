return {
  {
    "mfussenegger/nvim-treehopper",
  },
  -- {
  --   "phaazon/hop.nvim",
  --   config = function()
  --     require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
  --   end,
  -- },
  {
    "alexghergh/nvim-tmux-navigation",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
}
