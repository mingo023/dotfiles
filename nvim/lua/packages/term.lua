return {
 {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({})
      require("cores.lazygit")
      require("cores.term")
    end
  }
}
