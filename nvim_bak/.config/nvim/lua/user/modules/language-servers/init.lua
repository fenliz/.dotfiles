return {
	{
		"williamboman/mason.nvim",
		event = "BufReadPre",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",

			"b0o/SchemaStore.nvim", -- JSON
			"jose-elias-alvarez/typescript.nvim", -- TypeScript
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

			vim.keymap.set("n", "Ä", vim.diagnostic.goto_next)
			vim.keymap.set("n", "Ö", vim.diagnostic.goto_prev)

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.colorProvider = { dynamicRegistration = true }

			local opts = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/documentHighlight") then
						require("user.modules.language-servers.highlight").setup_highlight_on_hover(bufnr)
					end

					if client.supports_method("textDocument/formatting") then
						require("user.modules.language-servers.formatting").setup_format_on_save(bufnr)
					end

					if client.server_capabilities.colorProvider then
						require("document-color").buf_attach(bufnr)
					end

					require("user.modules.language-servers.keymaps").set_lsp_keymaps(client, bufnr)
				end,
			}

			local language_handlers = require("user.modules.language-servers.languages")

			require("mason-lspconfig").setup_handlers({
				["lua_ls"] = function()
					language_handlers.lua.setup(opts)
				end,
				["tsserver"] = function()
					language_handlers.typescript.setup(opts)
				end,
				["jsonls"] = function()
					language_handlers.json.setup(opts)
				end,
				function(server_name)
					require("lspconfig")[server_name].setup(opts)
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
					builtins.code_actions.eslint_d,
					require("typescript.extensions.null-ls.code-actions"),
					builtins.code_actions.gitsigns,

					builtins.diagnostics.eslint_d,
					builtins.diagnostics.jsonlint,
					builtins.diagnostics.actionlint,

					builtins.formatting.prettierd,
					builtins.formatting.stylua,
					builtins.formatting.eslint_d,
				},
			})
		end,
	},
	{
		"barrett-ruth/import-cost.nvim",
		event = "BufReadPre",
		build = "sh install.sh yarn",
		setup = true,
	},
	{
		"KostkaBrukowa/definition-or-references.nvim",
		even = "BufReadPre",
		keys = {
			{
				"gd",
				function()
					require("definition-or-references").definition_or_references()
				end,
				desc = "Go to definition",
			},
		},
	},
}
