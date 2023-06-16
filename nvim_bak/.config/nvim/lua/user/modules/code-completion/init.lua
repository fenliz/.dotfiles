return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"doxnit/cmp-luasnip-choice",

			"nvim-lua/plenary.nvim",
			"windwp/nvim-autopairs",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("nvim-autopairs").setup()
			require("cmp_luasnip_choice").setup()

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "luasnip_choice" },
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 3 },
					{ name = "nvim_lua", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
					{ name = "emoji" },
				}, { name = "buffer", keyword_length = 3 }),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, item)
						local icons = require("user.modules.code-completion.utils").kind_icons
						item.kind = string.format("%s", icons[item.kind])

						item.menu = ({
							path = "[Path]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[Lua]",
							luasnip = "[Snip]",
							emoji = "[Emoji]",
							buffer = "[Buffer]",
						})[entry.source.name]

						return item
					end,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
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
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip").config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				ext_opts = {
					[require("luasnip.util.types").choiceNode] = {
						active = {
							virt_text = { { "choiceNode", "Comment" } },
						},
					},
				},
				ext_base_prio = 300,
				ext_prio_increase = 1,
				enable_autosnippets = true,
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					suggestion = {
						auto_trigger = true,
						keymap = {
							accept = "<C-l>",
							next = "<C-k>",
							prev = "<C-j>",
						},
					},
				})
			end, 100)
		end,
	},
}