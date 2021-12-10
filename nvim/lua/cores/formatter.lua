require('formatter').setup({
    logging = false,
    filetype = {
        typescript = { -- prettier
            function()
                return {
                    exe = "./node_modules/.bin/prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end,
        },
        typescriptreact = { -- prettier
            function()
                return {
                    exe = "./node_modules/.bin/prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end,
        }
    }
})
