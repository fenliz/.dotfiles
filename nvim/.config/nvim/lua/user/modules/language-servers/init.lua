local M = {}

M.mappings = function()
	require("mapx").nname("<leader>x", "Diagnostics")

	nnoremap("<leader>xx", "<cmd>Trouble<cr>", "<silent>", "Toggle")

	nnoremap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", "<silent>", "Toggle workspace diagnostics")

	nnoremap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>", "<silent>", "Toggle document diagnostics")

	nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>", "<silent>", "Toggle loclist")

	nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>", "<silent>", "Toggle quickfix")
end

M.plugins = function(use)
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"nvim-lua/plenary.nvim",

			-- Language servers
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",

			-- Misc
			"b0o/SchemaStore.nvim",
		},
		config = function()
			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			vim.diagnostic.config({
				signs = { active = signs },
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					-- style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "sumneko_lua", "tsserver", "jsonls" },
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local opts = {
				capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
				on_attach = require("user.modules.language-servers.on_attach"),
			}

			require("user.modules.language-servers.null-ls")(opts)

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup(opts)
				end,
				["sumneko_lua"] = function()
					require("user.modules.language-servers.lua")(opts)
					require("lspconfig")["sumneko_lua"].setup(opts)
				end,
				["tsserver"] = function()
					require("user.modules.language-servers.typescript")(opts)
					require("lspconfig")["tsserver"].setup(opts)
				end,
				["jsonls"] = function()
					require("user.modules.language-servers.json")(opts)
					require("lspconfig")["jsonls"].setup(opts)
				end,
			})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("trouble").setup({
				use_diagnostics_signs = true,
			})
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({ hint_enable = false })
		end,
	})
end

return M
