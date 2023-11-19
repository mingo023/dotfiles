return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      -- set strategy
      vim.g["test#strategy"] = "vimux"

      -- set options for jest
      vim.g["test#javascript#jest#options"] = "--config jest-local.json"
    end,
  },
}
