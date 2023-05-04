vim.keymap.set("v", "<leader>sc", function()
  require('silicon').visualise_api({to_clip = true})
end)
