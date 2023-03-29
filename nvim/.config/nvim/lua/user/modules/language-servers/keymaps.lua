local M = {}

M.set_lsp_keymaps = function(client, buffer)
	local opts = { buffer = buffer }

	if client.supports_method("textDocument/codeAction") then
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
		vim.keymap.set("v", "ga", vim.lsp.buf.code_action, opts)
	end

	if client.supports_method("textDocument/rename") then
		vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
	end

	if client.supports_method("textDocument/references") then
		vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
	end

	if client.supports_method("textDocument/definition") then
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	end

	if client.supports_method("textDocument/declaration") then
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	end

	if client.supports_method("textDocument/implementation") then
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	end

	if client.supports_method("textDocument/hover") then
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end

	if client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "gf", function()
			require("user.modules.language-servers.formatting").format(buffer)
		end, opts)
	end
end

return M
