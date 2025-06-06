require("codecompanion").setup({
  adapters = {
    anthropic = "anthropic",
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "gemini-2.5-pro",
          },
        },
      })
    end,
    gemini = "gemini",
    ollama = "ollama",
    openai = "openai",
    opts = {
      allow_insecure = false, -- Allow insecure connections?
      proxy = nil, -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
    },
  },
  strategies = {},
})
