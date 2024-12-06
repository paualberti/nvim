return {
	"jinh0/eyeliner.nvim",
	config = function()
		require("eyeliner").setup({
			highlight_on_key = false, -- must be set to true for dimming to work
			dim = true,
		})
		vim.api.nvim_set_hl(0, "EyelinerPrimary", { bold = true, underline = false })
		vim.api.nvim_set_hl(0, "EyelinerSecondary", { bold = true, underline = false })
        vim.cmd("EyelinerToggle")
		vim.cmd("highlight EyelinerPrimary guifg=#FFFF00")
		vim.cmd("highlight EyelinerSecondary guifg=#EE00EE")
	end,
	vim.keymap.set(
		"n",
		"<leader>te",
		"<cmd>EyelinerToggle<cr>",
		{ noremap = true, silent = true, desc = "[T]oggle [E]yeliner" }
	),
}
