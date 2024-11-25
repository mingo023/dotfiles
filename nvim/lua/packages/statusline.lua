return {
  {
    "rebelot/heirline.nvim",
    event = "UiEnter",
    config = function()
      require("cores.statusline")
    end,
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = {
          margin = { vertical = 0, horizontal = 1 },
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          return {
            " ",
            { filename },
            " ",
            guibg = "#44406e",
          }
        end,
      })
    end,
  },
}
