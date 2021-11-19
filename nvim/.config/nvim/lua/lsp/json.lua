local M = {}

M.extend_config = function(config)
    config.settings = {
        json = {
            schemas = {
                node = {
                    fileMatch = {"package.json"},
                    url = "https://json.schemastore.org/package.json"
                },
                tsconfig = {
                    fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
                    url = 'http://json.schemastore.org/tsconfig'
                },
                lerna = {
                    fileMatch = {'lerna.json'},
                    url = 'http://json.schemastore.org/lerna'
                },
                babel = {
                    fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
                    url = 'http://json.schemastore.org/lerna'
                },
                eslint = {
                    fileMatch = {'.eslintrc.json', '.eslintrc'},
                    url = 'http://json.schemastore.org/eslintrc'
                },
                prettier = {
                    fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
                    url = 'http://json.schemastore.org/prettierrc'
                },
            }
        }
    }
	config.on_attach = function(client)
		-- Formatting will be done by null-ls
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

return M
