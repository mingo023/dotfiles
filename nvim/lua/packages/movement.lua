return {
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
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
}
