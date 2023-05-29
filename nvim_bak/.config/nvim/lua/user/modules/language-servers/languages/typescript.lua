local M = {}

M.setup = function(opts)
	require("typescript").setup({
		server = {
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
