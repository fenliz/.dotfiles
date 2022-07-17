local luasnip = require("luasnip")
local types = require("luasnip.util.types")

local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node

require("luasnip.loaders.from_vscode").lazy_load()

local function copy(args)
	return args[1]
end

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
})

luasnip.snippets = {
	all = {
		-- Function
		s("fn", {
			t("//Parameters: "),
			f(copy, 2),
			t({ "", "function " }),
			i(1),
			t("("),
			i(2, "int foo"),
			t({ ") {", "\t" }),
			i(0),
			t({ "", "}" }),
		}),

		-- Class
		s("class", {
			c(1, {
				t("public "),
				t("private "),
			}),
			t("class "),
			i(2),
			t(" "),
			c(3, {
				t("{"),
				sn(nil, {
					t("extends "),
					i(1),
					t(" {"),
				}),
				sn(nil, {
					t("implements "),
					i(1),
					t(" {"),
				}),
			}),
			t({ "", "\t" }),
			i(0),
			t({ "", "}" }),
		}),
	},
}
