return function(opts)
	opts.handlers = {
		["textDocument/definition"] = function(err, result, method, ...)
			if vim.tbl_islist(result) and #result > 1 then
				result = vim.tbl_filter(function(v)
					return not string.find(v.targetUri, "react/index.d.ts")
				end, result)
			end

			vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
		end,
	}

	require("lspconfig").tsserver.setup(opts)
end
