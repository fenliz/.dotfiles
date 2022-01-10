return function(bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Actions
    keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('v', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    -- Documentation/References
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- Diagnostics
    keymap('n', 'gf', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap('n', 'Ä', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    keymap('n', 'Ö', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
end
