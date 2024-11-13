return {
	"tamton-aquib/duck.nvim",
	config = function()
		vim.keymap.set("n", "\\", function()
			require("duck").hatch()
		end)
		vim.keymap.set("n", "|", function()
			require("duck").cook_all()
		end)
	end,
}
