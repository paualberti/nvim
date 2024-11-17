return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				-- Custom configuration for builtin pickers, if needed.
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local map = function(lhs, rhs, opts)
			vim.keymap.set("n", lhs, rhs, opts)
		end

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		map("<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		map("<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		map("<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		map("<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		map("<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		map("<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		map("<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		map("<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		map("<leader>so", builtin.oldfiles, { desc = "[S]earch [O]ld files" })
		map("<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })

		-- Slightly advanced example of overriding default behavior and theme
		map("<leader>sc", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))
		end, { desc = "[S]earch [C]urrent buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		map("<leader>st", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch by [T]ext" })

		-- Shortcut for searching your Neovim configuration files
		map("<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		local ignore_patterns = {
			"%.o",
			"%.d",
			"%.json",
		}
		require("telescope.config").set_defaults({
			file_ignore_patterns = ignore_patterns,
		})
	end,
}
