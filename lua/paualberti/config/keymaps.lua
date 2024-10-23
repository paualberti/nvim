local nmap = function(lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set("n", lhs, rhs, opts)
end
local vmap = function(lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set("v", lhs, rhs, opts)
end
local imap = function(lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set("i", lhs, rhs, opts)
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
nmap("<leader>qf", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "[Q]uick_[F]ix" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Useful keymaps
nmap("j", "gj") -- Visual j
nmap("k", "gk") -- Visual k
nmap("Y", "yg$") -- Yank till eol
nmap("J", "mzJ`z") -- Join lines
nmap("<C-d>", "<C-D>zz") -- Center view
nmap("<C-u>", "<C-U>zz") -- Center view
nmap("n", "nzzzv", { noremap = true, silent = false }) -- Center view
nmap("N", "Nzzzv", { noremap = true, silent = false }) -- Center viewkey
nmap("Q", "<nop>") -- Disable Q
imap("<C-c>", "<Esc>") -- Standardize <Esc>
nmap("<leader>bd", "<cmd> %bd | e# <CR>") -- Clean buffers
nmap("<C-Up>", "<C-w>3+") -- Increase window height
nmap("<C-Down>", "<C-w>3-") -- Decrease window height
nmap("<C-Right>", "<C-w>3>") -- Increase window width
nmap("<C-Left>", "<C-w>3<") -- Decrease window width
nmap("<leader>qs", "<cmd> wq <CR>", { noremap = true, silent = true, desc = "[Q]uit [S]aving" })

vmap("<", "<gv") -- Indent left
vmap(">", ">gv") -- Indent right
vmap("<leader>r", '"hy:%s/<C-r>h/', { noremap = true, silent = false, desc = "[R]eplace text" })

-- Move selected line / block of text in visual mode
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- Don't yank deleted text
vmap("<leader>d", '"_d')
nmap("x", '"_x')
vim.keymap.set("x", "<leader>p", '"_dP')

nmap("<leader>e", "<cmd>Ex<CR>")
nmap(
	"<leader>hl",
	"<cmd>lua Temporary_hlsearch(3) <CR>",
	{ noremap = true, silent = true, desc = "[H]igh[L]ight search" }
)
nmap("<leader>to", function()
	vim.cmd("vsplit")
	vim.cmd("terminal")
	vim.cmd("norm i")
end, { noremap = true, silent = true, desc = "[T]erminal [O]pen" })

-- go to next diagnostic
imap("<C-d>", function()
	vim.diagnostic.goto_next({ float = false })
	vim.cmd('norm "_diw')
end)
