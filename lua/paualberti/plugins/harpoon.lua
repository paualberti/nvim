return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function() -- Harpoon setup
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		local nmap = function(lhs, rhs, opts)
			opts = opts or { noremap = true, silent = true }
			vim.keymap.set("n", lhs, rhs, opts)
		end

		-- Keymaps for Harpoon
		nmap("<leader>a", mark.add_file, { noremap = true, silent = true, desc = "[A]dd file to harpoon" }) -- Add file to Harpoon
		nmap("<leader>h", ui.toggle_quick_menu, { noremap = true, silent = true, desc = "[H]arpoon" }) -- Toggle Harpoon quick menu

		-- Map <Tab> to navigate to the next file in Harpoon's Quick Menu
		nmap("<Tab>", function()
			ui.nav_next()
		end)

		-- Map <S-Tab> to navigate to the previous file in Harpoon's Quick Menu
		nmap("<S-Tab>", function()
			ui.nav_prev()
		end)

		nmap("<leader>1", function()
			ui.nav_file(1)
		end, { noremap = true, silent = true, desc = "Harpoon file [1]" }) -- Navigate to file 1
		nmap("<leader>2", function()
			ui.nav_file(2)
		end, { noremap = true, silent = true, desc = "Harpoon file [2]" }) -- Navigate to file 2
		nmap("<leader>3", function()
			ui.nav_file(3)
		end, { noremap = true, silent = true, desc = "Harpoon file [3]" }) -- Navigate to file 3
		nmap("<leader>4", function()
			ui.nav_file(4)
		end, { noremap = true, silent = true, desc = "Harpoon file [4]" }) -- Navigate to file 4
	end,
}
