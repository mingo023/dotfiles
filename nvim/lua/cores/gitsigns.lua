local present, gitsigns = pcall(require, "gitsigns")
if not present then
  return
end

gitsigns.setup({
  sign_priority = 5,
  signs = {
    add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAdd" },
    change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChange" },
    delete = { hl = "GitSignsDelete", text = "▁", numhl = "GitSignsDeleteNr", linehl = "GitSignsDelete" },
    topdelete = { hl = "GitSignsDelete", text = "▔", numhl = "GitSignsDeleteNr", linehl = "GitSignsDelete" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChange" },
  },
  status_formatter = nil, -- Use default
  attach_to_untracked = true,
  watch_gitdir = {
    interval = 100,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk)
    map("n", "<leader>hr", gs.reset_hunk)
    map("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("n", "<leader>hp", gs.preview_hunk)
    map("n", "<Leader>hl", ":Gitsigns setqflist<CR>")
  end,
})

vim.api.nvim_set_hl(0, "GitSignsAdd", { ctermbg = 0, bg = transparent, fg = "#69FF94" })
vim.api.nvim_set_hl(0, "GitSignsChange", { ctermbg = 0, bg = transparent, fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { ctermbg = 0, bg = transparent, fg = "#E06C75" })

