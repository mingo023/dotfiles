local silicon_present, silicon = pcall(require, "silicon")

if not silicon_present then
  return
end

vim.keymap.set("v", "<leader>sc", function()
  silicon.visualise_api({ to_clip = true })
  -- vim.notify("Visualised API copied to clipboard", "info", {title = "Silicon"})
end)
