return {
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
}
