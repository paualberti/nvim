return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "yes",
				show_close_icon = false,
				show_buffer_close_icons = false,
				tab_size = 15,
				enforce_regular_tabs = true,
				right_trunc_marker = "|",
			},
		})
	end,
}
