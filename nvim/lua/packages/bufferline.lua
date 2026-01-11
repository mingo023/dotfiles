return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          indicator = {
            icon = "", -- this should be omitted if indicator style is not 'icon'
            style = "none",
          },
          buffer_close_icon = "",
        },
      })
    end,
  },
}
