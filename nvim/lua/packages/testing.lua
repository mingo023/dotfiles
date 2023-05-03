return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest"
    },
    config = function()
      require("cores.testing")
    end
  }
}
