local map = function(mode, lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "[Q]uick_Fix" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>")

-- Useful keymaps
map("n", "j", "gj") -- Visual j
map("n", "k", "gk") -- Visual k
map("n", "Y", "yg$") -- Yank till eol
map("n", "J", "mzJ`z") -- Join lines
map("n", "<C-d>", "<C-D>zz") -- Center view
map("n", "<C-u>", "<C-U>zz") -- Center view
map("n", "n", "nzzzv", { noremap = true, silent = false }) -- Center view
map("n", "N", "Nzzzv", { noremap = true, silent = false }) -- Center viewkey
map("n", "Q", "<nop>") -- Disable Q
map("i", "<C-c>", "<Esc>") -- Standardize <Esc>
map("n", "<leader>bd", "<cmd> %bd | e# <CR>") -- Clean buffers
map("n", "<C-Up>", "<C-w>3+") -- Increase window height
map("n", "<C-Down>", "<C-w>3-") -- Decrease window height
map("n", "<C-Right>", "<C-w>3>") -- Increase window width
map("n", "<C-Left>", "<C-w>3<") -- Decrease window width

map("v", "<", "<gv") -- Indent left
map("v", ">", ">gv") -- Indent right
map("v", "<leader>r", '"hy:%s/<C-r>h/', { noremap = true, silent = false, desc = "[R]eplace text" })

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Don't yank deleted text
map("v", "<leader>d", '"_d')
map("n", "x", '"_x')
map("x", "<leader>p", '"_dP')

-- map("n", "<leader>e", "<cmd>Ex<CR>")
map("n", "<leader>to", function()
	vim.cmd("vsplit")
	vim.cmd("terminal")
	vim.cmd("norm i")
end, { noremap = true, silent = true, desc = "[T]erminal [O]pen" })

-- go to next diagnostic
map("i", "<C-d>", function()
	vim.diagnostic.goto_next({ float = false })
	vim.cmd('norm "_diw')
end)
