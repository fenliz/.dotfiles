return function(client, bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Highlight
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
            augroup LspDocumentHighlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end

    -- Formatting
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]]
    end
    keymap('n', 'ga', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)

    -- Actions
    keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('v', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    -- Documentation/References
    keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- Diagnostics
    keymap('n', 'gf', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap('n', 'Ä', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    keymap('n', 'Ö', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
end
