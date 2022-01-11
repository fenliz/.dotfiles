return function(opts)
    opts.settings = {
        json = {
            schemas = require'schemastore'.json.schemas(),
        }
    }

    -- Disable builtin formatting in favor of null-ls
	opts.on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end