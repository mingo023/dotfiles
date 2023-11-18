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

      -- set options for jest
      vim.g["test#javascript#jest#options"] = "--config jest-local.json"
    end,
  },
}
