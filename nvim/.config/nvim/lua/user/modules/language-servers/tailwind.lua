return function(opts)
	opts.on_attach = function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require("document-color").buf_attach(bufnr)
		end
	end

	opts.capabilities.textDocument.colorProvider = {
		dynamicRegistration = true,
	}
end
