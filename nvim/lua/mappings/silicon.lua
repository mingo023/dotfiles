vim.keymap.set("v", "<leader>sc", function()
  require("nvim-silicon").clip()
end, { silent = true })
