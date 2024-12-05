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
		nmap("<leader>ha", mark.add_file, { noremap = true, silent = true, desc = "[H]arpoon [A]dd file" }) -- Add file to Harpoon
		nmap("<leader>hm", ui.toggle_quick_menu, { noremap = true, silent = true, desc = "[H]arpoon [M]enu" }) -- Toggle Harpoon quick menu

		-- Map <tab> to navigate to the next file in Harpoon's Quick Menu
		nmap("<tab>", function()
			ui.nav_next()
		end)

		-- Map <s-tab> to navigate to the previous file in Harpoon's Quick Menu
		nmap("<s-tab>", function()
			ui.nav_prev()
		end)

	end,
}
