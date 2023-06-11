return {
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("cores.bufferline")
    end
  }
}
