local null_ls = require("null-ls")

return function(opts)
	null_ls.setup({
		sources = {
			-- Code actions
			null_ls.builtins.code_actions.gitsigns,
			null_ls.builtins.code_actions.eslint_d,

			-- Diagnostics
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.diagnostics.jsonlint,
			null_ls.builtins.diagnostics.actionlint,

			-- Formatting
			null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.stylua,

			-- Language servers
			require("typescript.extensions.null-ls.code-actions")
		},
		on_attach = opts.on_attach,
	})
end
