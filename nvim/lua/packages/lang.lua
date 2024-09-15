return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("cores.treesitter")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("cores.lspsaga")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        warn_no_results = false,
        auto_close = true,
        focus = true,
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          yaml = true,
          markdown = true,
          handlebars = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 24,
          keymap = {
            accept = "<C-j>",
            next = "<C-n>",
          },
        },
        copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/mise/installs/node/20/bin/node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.diff",
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          anthropic = "anthropic",
          copilot = "copilot",
          gemini = "gemini",
          ollama = "ollama",
          openai = "openai",
          opts = {
            allow_insecure = false, -- Allow insecure connections?
            proxy = nil, -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
          },
        },
        strategies = {
          -- CHAT STRATEGY ----------------------------------------------------------
          chat = {
            adapter = "copilot",
            roles = {
              llm = "CodeCompanion", -- The markdown header content for the LLM's responses
              user = "Me", -- The markdown header for your questions
            },
          },
          inline = {
            adapter = "copilot",
            keymaps = {
              accept_change = {
                modes = {
                  n = "ga",
                },
                index = 1,
                callback = "keymaps.accept_change",
                description = "Accept change",
              },
              reject_change = {
                modes = {
                  n = "gr",
                },
                index = 2,
                callback = "keymaps.reject_change",
                description = "Reject change",
              },
            },
            prompts = {
              -- The prompt to send to the LLM when a user initiates the inline strategy and it needs to convert to a chat
              inline_to_chat = function(context)
                return "I want you to act as an expert and senior developer in the "
                  .. context.filetype
                  .. " language. I will ask you questions, perhaps giving you code examples, and I want you to advise me with explanations and code where neccessary."
              end,
            },
          },
        },
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
}
