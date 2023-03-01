local highlight_augroup = vim.api.nvim_create_augroup("LspHightlight", { clear = true })
local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

return function(client, bufnr)
	local opts = { silent = true, buffer = bufnr }

	-- Highlight
	if client.supports_method("textDocument/documentHighlight") then
		vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = bufnr })

		vim.api.nvim_create_autocmd("CursorHold", {
			group = highlight_augroup,
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = highlight_augroup,
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

	-- Formatting
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(formatter)
						return formatter.name == "null-ls"
					end,
				})
			end,
		})

		vim.keymap.set("n", "gf", function()
			vim.lsp.buf.format({ timeout_ms = 2000, bufnr = bufnr })
		end, opts)
	end

	if client.server_capabilities.colorProvider then
		require("document-color").buf_attach(bufnr)
	end

	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("v", "ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "Ä", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "Ö", vim.diagnostic.goto_prev, opts)
end
