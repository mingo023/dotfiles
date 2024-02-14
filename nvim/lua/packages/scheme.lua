return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- require("cores.theme.catppuccin")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd([[
        set background=dark
        let g:gruvbox_material_background = 'hard'
        let g:gruvbox_material_better_performance=1
        colorscheme gruvbox-material
      ]])
    end,
  },
}
