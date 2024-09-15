local map = function(mode, lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Function to enable hlsearch temporarily
function Temporary_hlsearch(seconds) -- Enable hlsearch
	vim.opt.hlsearch = true
	local duration_ms = seconds * 1000
	vim.defer_fn(function()
		vim.opt.hlsearch = false
	end, duration_ms)
end

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, {})

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")

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
map("n", "<leader>bd", "<cmd> %bd | e# <CR>")
map("n", "<C-Up>", "<C-w>3+")
map("n", "<C-Down>", "<C-w>3-")
map("n", "<C-Right>", "<C-w>3>")
map("n", "<C-Left>", "<C-w>3<")

map("v", "<", "<gv") -- Indent left
map("v", ">", ">gv") -- Indent right
map("i", "jk", "<Esc>") -- Escape
map("i", "kj", "<Esc>") -- Escape
map("v", "<leader>r", '"hy:%s/<C-r>h/', { noremap = true, silent = false, desc = "[R]eplace text" })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Using the void register
map("n", "<leader>d", '"_d', { noremap = true, silent = false })
map("v", "<leader>d", '"_d', { noremap = true, silent = false })
map("x", "p", '"_dP')

map("n", "<leader>te", "<cmd> vsplit | terminal | norm i <CR>")
map("n", "<leader>hl", "<cmd> lua Temporary_hlsearch(2) <CR>")

-- go to next diagnostic
map("i", "<C-d>", function()
	vim.diagnostic.goto_next({ float = false })
	vim.cmd('norm "_diw')
end)
