return function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Mappings.
    local opts = {
        noremap = true,
        silent = true
    }

    -- Avoid TSServer clashing with Prettier
    client.resolved_capabilities.document_formatting = false

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>ca', ':Lspsaga code_action <CR>', opts)
    buf_set_keymap('n', 'gr', ':TroubleToggle lsp_references <CR>', opts)
    buf_set_keymap('n', '<C-r>', ':Lspsaga rename<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.cmd('augroup Format')
        vim.cmd('autocmd! * <buffer>')
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)')
        vim.cmd('augroup END')
    end
end
