return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "dots_ellipsis",
        },
        window = {
          blend = 0,
          relative = "editor",
        },
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 0.8,
        },
      })
    end,
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "FiraCode Nerd Font",
        theme = "OneHalfDark",
        to_clipboard = true,
        background_image = "/Users/minhngo/.config/wallpapers/macos-blue.jpg",
        language = function()
          local ft = vim.bo.filetype
          if ft == "php" then
            return "PHP Source"
          end

          return ft
        end,
        window_title = function()
          return vim.fn.expand("%:t")
        end,
      })

      vim.keymap.set("v", "<leader>sc", ":Silicon<CR>", { silent = true })
    end,
  },
  {
    "onsails/lspkind.nvim",
  },
}
