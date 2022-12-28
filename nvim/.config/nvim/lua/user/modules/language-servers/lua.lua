return function(opts)
	opts.settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ":"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	}

	require("lspconfig").sumneko_lua.setup(opts)
end
