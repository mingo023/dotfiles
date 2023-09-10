return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("cores.testing")
    end,
  },
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      -- set strategy
      vim.g["test#strategy"] = "vimux"
    end,
  },
}
