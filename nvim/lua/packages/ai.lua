return {
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
          cs = true,
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
        copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/mise/installs/node/22/bin/node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
}
