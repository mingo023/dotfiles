require("neotest").setup({
  adapters = {
    require("neotest-rspec"),
    require("neotest-jest")({
      jestCommand = "npm run test:e2e --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  },
})
