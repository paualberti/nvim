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
				["q"] = { "actions.close", mode = "n" },
			},
			win_options = {
				winbar = "%{v:lua.CustomOilBar()}",
			},
			view_options = {
				show_hidden = false,
				is_always_hidden = function(name, _)
					-- List of folders to always hide
					local folder_skip = {
						".git",
						"..",
					}
					if vim.tbl_contains(folder_skip, name) then
						return true
					end

					-- Patterns for files to hide
					local file_patterns = {
						"%.json$",
						"%.class$",
						"%.o$",
						"%.d$",
					}
					for _, pattern in ipairs(file_patterns) do
						if name:match(pattern) then
							return true
						end
					end

					return false
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
