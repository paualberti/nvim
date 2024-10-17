-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Set mapleader globally
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Set number and relativenumber in netrw
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
	{
		require("paualberti.plugins.nvim-java"),
		require("paualberti.plugins.lsp-zero"),
		require("paualberti.plugins.conform"),
		require("paualberti.plugins.gitsigns"),
		require("paualberti.plugins.harpoon"),
		require("paualberti.plugins.indent-blankline"),
		require("paualberti.plugins.lazydev"),
		require("paualberti.plugins.lint"),
		require("paualberti.plugins.luvit-meta"),
		require("paualberti.plugins.marks"),
		require("paualberti.plugins.neo-tree"),
		require("paualberti.plugins.nvim-autopairs"),
		require("paualberti.plugins.nvim-cmp"),
		require("paualberti.plugins.nvim-lspconfig"),
		require("paualberti.plugins.nvim-surround"),
		require("paualberti.plugins.nvim-treesitter"),
		require("paualberti.plugins.screenkey"),
		require("paualberti.plugins.telescope"),
		require("paualberti.plugins.todo-comments"),
		require("paualberti.plugins.tokyonight"),
		require("paualberti.plugins.vim-fugitive"),
		require("paualberti.plugins.which-key"),
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
