return function(opts)
	local on_attach = opts.on_attach

	opts.settings = {
		json = { schemas = require("schemastore").json.schemas() },
	}

	opts.on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		-- Disable builtin formatting in favor of null-ls
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end
end
