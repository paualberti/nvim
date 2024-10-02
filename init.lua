vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("paualberti.config.autocmds")
require("paualberti.config.options")
require("paualberti.config.keymaps")

require("lazy").setup({
	"tpope/vim-sleuth",
	-- { import = "paualberti.plugins" },
	-- { import = "kickstart.plugins" },
	{
		require("paualberti.plugins.harpoon"),
		require("kickstart.plugins.conform"),
		require("kickstart.plugins.gitsigns"),
		require("kickstart.plugins.indent_line"),
		require("kickstart.plugins.lazydev"),
		require("kickstart.plugins.lint"),
		require("kickstart.plugins.luvit-meta"),
		require("kickstart.plugins.neo-tree"),
		require("kickstart.plugins.nvim-autopairs"),
		require("kickstart.plugins.nvim-cmp"),
		require("kickstart.plugins.nvim-lspconfig"),
		require("kickstart.plugins.nvim-treesitter"),
		require("kickstart.plugins.telescope"),
		require("kickstart.plugins.todo-comments"),
		require("kickstart.plugins.tokyonight"),
		require("kickstart.plugins.which-key"),
	},
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
