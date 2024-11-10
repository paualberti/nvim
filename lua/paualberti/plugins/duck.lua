return {
	"tamton-aquib/duck.nvim",
	config = function()
		vim.keymap.set("n", "\\", function()
			require("duck").hatch()
		end, { desc = "[D]uck [H]atch" })
		vim.keymap.set("n", "<leader>dc", function()
			require("duck").cook_all()
		end, { desc = "[D]uck [C]ook All" })
	end,
}
