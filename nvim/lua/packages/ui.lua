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
  }
}
