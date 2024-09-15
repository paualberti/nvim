return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function() -- Harpoon setup
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		-- Keymaps for Harpoon
		vim.keymap.set("n", "<leader>a", mark.add_file) -- Add file to Harpoon
		vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu) -- Toggle Harpoon quick menu

		-- Map <Tab> to navigate to the next file in Harpoon's Quick Menu
		vim.keymap.set("n", "<Tab>", function() ui.nav_next() end)

		-- Map <S-Tab> to navigate to the previous file in Harpoon's Quick Menu
		vim.keymap.set("n", "<S-Tab>", function() ui.nav_prev() end)

		vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end) -- Navigate to file 1
		vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end) -- Navigate to file 2
		vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end) -- Navigate to file 3
		vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end) -- Navigate to file 4
		vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end) -- Navigate to file 4
		vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end) -- Navigate to file 4
		vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end) -- Navigate to file 4
		vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end) -- Navigate to file 4
		vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end) -- Navigate to file 4
	end,
}
