return function(opts)
	opts.settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = {
				enable = true,
			},
		},
	}

	require("lspconfig").jsonls.setup(opts)
end
