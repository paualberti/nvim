local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("lua", {
	s("ls.add_snippets", {
		t('ls.add_snippets("'),
		i(1, "filetype"),
		t({ '", {', '\ts("' }),
		i(2, "trig"),
		t({ '", {', "\t\t" }),
		i(3),
		t({ "", "\t}),", "})" }),
	}),
})
