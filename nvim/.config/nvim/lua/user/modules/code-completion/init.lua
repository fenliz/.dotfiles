local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local format = function(entry, item)
	item.kind = string.format("%s", kind_icons[item.kind])

	item.menu = ({
		path = "[Path]",
		copilot = "[AI]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[Lua]",
		luasnip = "[Snip]",
		emoji = "[Emoji]",
		buffer = "[Buf]",
	})[entry.source.name]

	return item
end

local M = {}

M.options = function()
	-- Code completion
	vim.o.completeopt = "menu,menuone,noselect,noinsert"

	-- Faster completion
	vim.o.updatetime = 300

	-- Copilot
	vim.g.copilot_no_tab_map = true
	vim.g.copilot_assume_mapped = true
	vim.g.copilot_tab_fallback = ""
end

M.mappings = function()
	inoremap("<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true }, "Copilot: Complete")
	inoremap("<C-k>", "copilot#Next()", { silent = true, expr = true }, "Copilot: Next")
end

M.plugins = function(use)
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"David-Kunz/cmp-npm",

			"nvim-lua/plenary.nvim",
			"windwp/nvim-autopairs",

			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",

			"github/copilot.vim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("nvim-autopairs").setup()
			require("cmp-npm").setup()

			cmp.setup({
				sources = cmp.config.sources({
					-- Dependencies
					{ name = "npm", keyword_length = 4 },

					-- Snippets
					{ name = "luasnip", keyword_length = 2 },

					-- LSP
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 3 },
					{ name = "nvim_lua", keyword_length = 3 },

					-- Misc
					{ name = "emoji" },
				}, { name = "buffer", keyword_length = 3 }),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = format,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					documentation = cmp.config.window.bordered(),
				},
			})

			-- cmp.setup.cmdline(":", {
			--   mapping = cmp.mapping.preset.cmdline(),
			--   sources = cmp.config.sources({
			--     { name = "path" },
			--   }, {
			--     { name = "cmdline" },
			--   }),
			-- })

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "nvim_Lsp_document_symbol" },
				}, {
					{ name = "buffer" },
				}),
			})

			require("user.modules.code-completion.snippets")
		end,
	})
end

return M
