return {
	{
		"williamboman/mason.nvim",
		event = "BufReadPre",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",

			-- Language specific
			"b0o/SchemaStore.nvim", -- JSON
		},
		keys = {
			{ "<leader>m", "<cmd>Mason<cr>", desc = "Language servers" },
			{ "<leader>M", "<cmd>LspRestart<cr>", desc = "Restart language servers" },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"graphql",
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"eslint_d",
					"prettierd",
					"stylua",
				},
				auto_update = true,
			})

			local opts = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				),
				on_attach = require("user.modules.language-servers.on_attach"),
			}
			opts.capabilities.textDocument.colorProvider = {
				dynamicRegistration = true,
			}

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup(opts)
				end,
				["lua_ls"] = function()
					require("user.modules.language-servers.lua")(opts)
				end,
				["tsserver"] = function()
					require("user.modules.language-servers.typescript")(opts)
				end,
				["jsonls"] = function()
					require("user.modules.language-servers.json")(opts)
				end,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		config = function()
			local builtins = require("null-ls").builtins

			require("null-ls").setup({
				sources = {
					builtins.code_actions.gitsigns,
					builtins.code_actions.eslint_d,

					builtins.diagnostics.eslint_d,
					builtins.diagnostics.jsonlint,
					builtins.diagnostics.actionlint,

					builtins.formatting.prettierd,
					builtins.formatting.stylua,
					builtins.formatting.eslint_d,
				},
				on_attach = require("user.modules.language-servers.on_attach"),
			})
		end,
	},
	{
		"mrshmllow/document-color.nvim",
		event = "BufReadPre",
		config = function()
			require("document-color").setup({})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup({
				"*",
				-- Disable in filetypes covered by document-color.nvim
				"!css",
				"!html",
				"!tsx",
				"!dart",
			})
		end,
	},
	{
		"barrett-ruth/import-cost.nvim",
		event = "BufReadPre",
		build = "sh install.sh yarn",
		config = function()
			require("import-cost").setup()
		end,
	},
}
