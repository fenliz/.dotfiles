return function(opts)
    local on_attach = opts.on_attach

	opts.on_attach = function(client, bufnr)
        on_attach(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end
