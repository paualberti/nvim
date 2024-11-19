local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
	s("-", { t("_{"), i(1), t("}^{"), i(2), t("}") }),
})

ls.add_snippets("markdown", {
	s("[", { t("_{"), i(1), t("}") }),
})

ls.add_snippets("markdown", {
	s("]", { t("^{"), i(1), t("}") }),
})

ls.add_snippets("markdown", {
	s("fraction", { t("\\dfrac{"), i(1), t("}{"), i(2), t("}") }),
})

ls.add_snippets("markdown", {
	s("partial_derivative", { t("\\dfrac{\\partial{"), i(1), t("}}{\\partial{"), i(2), t("}}") }),
})

ls.add_snippets("markdown", {
	s("begin", { t("\\begin{"), i(1, "cases"), t({ "}", "" }), i(2), t("\\end{"), rep(1), t("}") }),
})

ls.add_snippets("markdown", {
	s("text", { t("\\text{"), i(1), t("}") }),
})
