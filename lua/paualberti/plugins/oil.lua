return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		CustomOilBar = function()
			local path = vim.fn.expand("%")
			path = path:gsub("oil://", "")

			return "  " .. vim.fn.fnamemodify(path, ":.")
		end

		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["<c-h>"] = false,
				["<c-l>"] = false,
				["<c-k>"] = false,
				["<c-j>"] = false,
				["-"] = false,
				["l"] = "actions.select",
				["h"] = "actions.parent",
			},
			win_options = {
				winbar = "%{v:lua.CustomOilBar()}",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
					return vim.tbl_contains(folder_skip, name)
				end,
			},
			float = {
				max_height = 20,
				max_width = 40,
			},
		})

		-- Open parent directory in normal window
		vim.keymap.set("n", "\\", "<cmd>Oil<cr>", { noremap = true, silent = true })
		-- Open parent directory in floating window
		vim.keymap.set("n", "-", require("oil").toggle_float, { noremap = true, silent = true })
	end,
}
