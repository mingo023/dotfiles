return {
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("cores.flash")
    end,
    keys = {
      {
        "S",
        mode = { "n" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "antoinemadec/FixCursorHold.nvim",
    config = function()
      vim.cmd([[ let g:cursorhold_updatetime = 100 ]])
    end,
  },
}
