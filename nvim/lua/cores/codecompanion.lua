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
      slash_commands = {
        ["buffer"] = {
          callback = "helpers.slash_commands.buffer",
          description = "Insert open buffers",
          opts = {
            contains_code = true,
            provider = "telescope", -- default|telescope|mini_pick|fzf_lua
          },
        },
      },
    },
  },
})
