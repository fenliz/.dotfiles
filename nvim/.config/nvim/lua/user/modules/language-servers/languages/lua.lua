local M = {}

M.setup = function(opts)
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

	require("lspconfig").lua_ls.setup(opts)
end

return M
