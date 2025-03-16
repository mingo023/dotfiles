return {
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "JetbrainsMono Nerd Font",
        to_clipboard = true,
        theme = "TwoDark",
        background_image = "/Users/minhngo/.config/wallpapers/dragon-anime.jpg",
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
    end,
  },
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({
        symbol_map = {
          Array = "",
          Boolean = "",
          Class = "",
          Color = "",
          Constant = "",
          Constructor = "",
          Copilot = "",
          Enum = "",
          EnumMember = "",
          Event = "",
          Field = "",
          File = "",
          Folder = "",
          Function = "",
          Interface = "",
          Key = "",
          Keyword = "",
          Method = "",
          Module = "",
          Namespace = "",
          Null = "",
          Number = "",
          Object = "",
          Operator = "",
          Package = "",
          Property = "",
          Reference = "",
          Snippet = "",
          String = "",
          Struct = "",
          Text = "",
          TypeParameter = "",
          Unit = "",
          Value = "",
          Variable = "",
          Macro = "", -- Macro
        },
      })
    end,
  },
}
