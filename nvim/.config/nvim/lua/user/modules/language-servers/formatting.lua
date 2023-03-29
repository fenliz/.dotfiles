local formatting_augroup = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

local M = {}

M.format = function(buffer)
	vim.lsp.buf.format({
		timeout_ms = 2000,
		bufnr = buffer,
		filter = function(formatter)
			return formatter.name == "null-ls"
		end,
	})
end

M.setup_format_on_save = function(buffer)
	vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = buffer })

	vim.api.nvim_create_autocmd("BufWritePre", {
		group = formatting_augroup,
		buffer = buffer,
		callback = function()
			M.format(buffer)
		end,
	})
end

return M
