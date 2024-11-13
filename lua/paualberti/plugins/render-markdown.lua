return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	}, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		local markdown = require("render-markdown")
		vim.keymap.set(
			"n",
			"<leader>ms",
			"<cmd> RenderMarkdown toggle <CR>",
			{ noremap = true, silent = true, desc = "[M]arkdown [S]hift" }
		)
	end,
}
