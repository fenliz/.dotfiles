local highlight_augroup = vim.api.nvim_create_augroup("LspHoverHightlight", { clear = true })

local M = {}

M.setup_highlight_on_hover = function(buffer)
	vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = buffer })

	vim.api.nvim_create_autocmd("CursorHold", {
		group = highlight_augroup,
		buffer = buffer,
		callback = vim.lsp.buf.document_highlight,
	})
	vim.api.nvim_create_autocmd("CursorMoved", {
		group = highlight_augroup,
		buffer = buffer,
		callback = vim.lsp.buf.clear_references,
	})
end

return M
