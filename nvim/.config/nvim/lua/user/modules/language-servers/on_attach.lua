local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local highlight_augroup = vim.api.nvim_create_augroup("LspHightlight", {})

return function(client, bufnr)
	-- Highlight
	if client.supports_method("textDocument/documentHighlight") then
		vim.api.nvim_clear_autocmds({
			group = highlight_augroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd(
			"CursorHold",
			{ group = highlight_augroup, buffer = bufnr, callback = vim.lsp.buf.document_highlight }
		)
		vim.api.nvim_create_autocmd(
			"CursorMoved",
			{ group = highlight_augroup, buffer = bufnr, callback = vim.lsp.buf.clear_references }
		)
	end

	-- Formatting
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})

		nnoremap(
			"gf",
			function()
				vim.lsp.buf.format({ timeout_ms = 2000 })
			end,
			"<silent>",
			"Format file",
			{
				buffer = bufnr,
			}
		)
	end

	-- Actions
	nnoremap(
		"ga",
		function()
			vim.lsp.buf.code_action()
		end,
		"<silent>",
		"Code actions",
		{
			buffer = bufnr,
		}
	)

	vnoremap(
		"ga",
		function()
			vim.lsp.buf.code_action()
		end,
		"<silent>",
		"Code actions",
		{
			buffer = bufnr,
		}
	)

	nnoremap(
		"gr",
		function()
			vim.lsp.buf.rename()
		end,
		"<silent>",
		"Rename",
		{
			buffer = bufnr,
		}
	)

	-- Documentation/References
	nnoremap(
		"gR",
		function()
			vim.lsp.buf.references()
		end,
		"<silent>",
		"References",
		{
			buffer = bufnr,
		}
	)

	nnoremap(
		"gd",
		function()
			vim.lsp.buf.definition()
		end,
		"<silent>",
		"Definition",
		{
			buffer = bufnr,
		}
	)

	nnoremap(
		"gD",
		function()
			vim.lsp.buf.declaration()
		end,
		"<silent>",
		"Declaration",
		{
			buffer = bufnr,
		}
	)

	nnoremap(
		"gi",
		function()
			vim.lsp.buf.implementation()
		end,
		"<silent>",
		"Implementation",
		{
			buffer = bufnr,
		}
	)

	nnoremap(
		"K",
		function()
			vim.lsp.buf.hover()
		end,
		"<silent>",
		"Hover",
		{
			buffer = bufnr,
		}
	)
	nnoremap(
		"Ä",
		function()
			vim.diagnostic.goto_next()
		end,
		"<silent>",
		"Next diagnostic",
		{
			buffer = bufnr,
		}
	)
	nnoremap(
		"Ö",
		function()
			vim.diagnostic.goto_prev()
		end,
		"<silent>",
		"Previous diagnostic",
		{
			buffer = bufnr,
		}
	)
end
