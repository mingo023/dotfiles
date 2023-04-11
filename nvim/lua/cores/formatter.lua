local prettierFormatter = function()
    return {
        exe = "prettierd",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local goFormatter = function() require('go.format').gofmt() end

local luaFormatter = function()
    return {
        exe = "lua-format",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

require('formatter').setup({
    logging = false,
    filetype = {
        typescript = prettierFormatter,
        typescriptreact = prettierFormatter,
        javascript = prettierFormatter,
        go = goFormatter,
        lua = luaFormatter,
    }
})
