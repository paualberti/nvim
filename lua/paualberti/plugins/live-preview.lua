return {
	"brianhuster/live-preview.nvim",
	dependencies = {
		-- 'brianhuster/autosave.nvim',  -- Not required, but recomended for autosaving and sync scrolling

		-- You can choose one of the following pickers
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
		"echasnovski/mini.pick",
	},
	opts = {},
	vim.keymap.set(
		"n",
		"<leader>mp",
		"<cmd>LivePreview pick<cr>",
		{ noremap = true, silent = true, desc = "[M]arkdown [P]ick" }
	),
	vim.keymap.set(
		"n",
		"<leader>mc",
		"<cmd>LivePreview close<cr>",
		{ noremap = true, silent = true, desc = "[M]arkdown [C]lose" }
	),
}
