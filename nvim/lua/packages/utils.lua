return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      zen = {
        enabled = false,
        toggles = {
          dim = false,
          git_signs = true,
          mini_diff_signs = true,
        },
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          {
            section = "recent_files",
            indent = 2,
            padding = 1,
            cwd = true,
          },
        },
        preset = {
          header = [[
               ,-.       _,---._ __  / \
              /  )    .-'       `./ /   \
             (  (   ,'            `/    /|
              \  `-"             \'\   / |
               `.              ,  \ \ /  |
                /`.          ,'-`----Y   |
               (            ;        |   '
               |  ,-.    ,-'         |  /
               |  | (   |            | /
               )  |  \  `.___________|/
               `--'   `--'
                   What's up, Cá? 😼          ]],
        },
      },
    },
    keys = {
      {
        "<C-w>o",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
    },
  },
}
