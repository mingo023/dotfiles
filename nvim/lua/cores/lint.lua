local lint = require("lint")

lint.linters_by_ft = {
  typescript = { "cspell" },
  ruby = { "rubocop", "cspell" },
  php = { "cspell" },
  python = { "ruff", "cspell" },
}

local cspell_path = vim.fn.stdpath("config") .. "/spell/cspell.json"
if vim.fn.filereadable(vim.fn.getcwd() .. "/cspell.json") == 1 then
  cspell_path = vim.fn.getcwd() .. "/cspell.json"
end

lint.linters.cspell.args = {
  "--no-color",
  "--no-progress",
  "--config",
  cspell_path,
  "--no-summary",
  function()
    return "stdin://" .. vim.api.nvim_buf_get_name(0)
  end,
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
