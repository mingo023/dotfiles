return {
  {
    "windwp/nvim-autopairs",
    dependencies = "nvim-cmp",
    config = function()
      require("cores.auto-pair")
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "b3nj5m1n/kommentary",
    config = function()
      local config = require("kommentary.config")

      config.configure_language("default", {
        prefer_single_line_comments = true,
      })
      config.configure_language("php", {
        prefer_single_line_comments = true,
      })
      config.configure_language("py", {
        prefer_single_line_comments = true,
        single_line_comment_string = "#",
        multi_line_comment_strings = { '"""', '"""' },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        signs = false,
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
        },
      })
    end,
  },
  {
    "tpope/vim-surround",
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("spectre").setup({
        replace_engine = {
          ["sed"] = {
            cmd = "sed",
            args = {
              "-i",
              "",
              "-E",
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          vue = { "prettierd", "prettier", stop_after_first = true },
          go = { "gofumpt", "gofmt", "goimports_reviser", "golines" },
          php = { "pint", "php-cs-fixer" },
          ruby = { "rubocop", stop_after_first = true },
          python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
          cs = {
            "csharpier",
          },
        },
      })

      conform.formatters.csharpier = {
        command = "dotnet",
        args = { "csharpier", "format", "--write-stdout" },
        stdin = true,
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        typescript = { "cspell" },
        ruby = { "rubocop", "cspell" },
        php = { "cspell" },
        python = { "ruff", "cspell" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    version = "*",
    config = function()
      require("mini.splitjoin").setup()
    end,
  },
}
