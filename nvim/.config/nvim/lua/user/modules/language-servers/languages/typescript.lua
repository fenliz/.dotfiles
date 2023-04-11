local M = {}

M.setup = function(opts)
	require("typescript").setup({
		server = {
			handlers = {
				["textDocument/definition"] = function(err, result, ...)
					if vim.tbl_islist(result) and #result > 1 then
						result = vim.tbl_filter(function(v)
							return not string.find(v.targetUrl, "react/index.d.ts")
						end, result)
					end

					vim.lsp.handlers["textDocument/definition"](err, result, ...)
				end,
			},
			on_attach = function(client, bufnr)
				opts.on_attach(client, bufnr)

				vim.keymap.set("n", "go", "<cmd>TypescriptAddMissingImports<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gO", "<cmd>TypescriptOrganizeImports<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gI", "<cmd>TypescriptRenameFile<cr>", { buffer = bufnr })
			end,
		},
	})
end

return M
