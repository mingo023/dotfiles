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
}
