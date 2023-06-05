return {
  {
    'j-hui/fidget.nvim',
    config = function()
        require"fidget".setup{}
    end
  },
  {
    "Pocco81/true-zen.nvim"
  },
  {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('silicon').setup({font = 'Hack=20', theme = 'Coldark-Dark'})
    end
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require('notify')
      notify.setup({
        stages = "fade_in_slide_out",
        timeout = 1000,
        background_colour = "#1e222a",
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
      vim.notify =  notify
    end
  }
}
