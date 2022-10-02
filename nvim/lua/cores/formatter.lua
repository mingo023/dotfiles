require('formatter').setup({
    logging = false,
    filetype = {
        typescript = { -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end,
        },
        typescriptreact = { -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end,
        },
        javascript = { -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end,
        },
        go = {
            function()
                require('go.format').gofmt()
            end,
        },
        ["*"] = {
            function()
                vim.lsp.buf.format()
            end
        }
    }
})
