local null_ls = require'null-ls'

null_ls.setup {
    sources = {
        -- Code actions
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.eslint_d,

        -- Diagnostics
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.jsonlint,

        -- Formatting
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
    }
}
