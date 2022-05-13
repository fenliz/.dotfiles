local formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local highlight_augroup = vim.api.nvim_create_augroup('LspHightlight', {})
local diagnostics_augroup = vim.api.nvim_create_augroup('LspDiagnostics', {})

return function(client, bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Highlight
    if client.supports_method('textDocument/documentHighlight') then
      vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('CursorHold', { group = highlight_augroup, buffer = bufnr, callback = vim.lsp.buf.document_highlight })
      vim.api.nvim_create_autocmd('CursorMoved', { group = highlight_augroup, buffer = bufnr, callback = vim.lsp.buf.clear_references })
    end

    -- Formatting
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', { group = formatting_augroup, buffer = bufnr, callback = function() vim.lsp.buf.format() end })
    end
    keymap('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

    -- Actions
    keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('v', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    -- Documentation/References
    keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- Diagnostics
    -- vim.api.nvim_clear_autocmds({ group = diagnostics_augroup })
    -- vim.api.nvim_create_augroup('CursorHold')
    -- vim.cmd [[
    --     augroup LspDiagnostics
    --         autocmd! * <buffer>
    --         autocmd CursorHold,CursorHoldI <buffer> lua vim.diagnostic.open_float()
    --     augroup END
    -- ]]
    keymap('n', 'Ä', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    keymap('n', 'Ö', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
end
