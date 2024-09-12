local map = function(mode, lhs, rhs, opts)
	opts = { noremap = true, silent = true } or opts
	vim.keymap.set(mode, lhs, rhs, opts)
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
map("n", "n", "nzzzv") -- Center view
map("n", "N", "Nzzzv") -- Center view
map("n", "Q", "<nop>") -- Disable Q
map("i", "<C-c>", "<Esc>") -- Standardize <Esc>
map("i", "<C-d>", function()
	vim.diagnostic.goto_next({ float = false })
	vim.cmd('norm "_diw')
end)
-- map("n", "\\", function()
-- 	vim.cmd("bd")
-- 	vim.cmd("edit .")
-- end, { noremap = true, silent = true })

map("v", "<", "<gv") -- Indent left
map("v", ">", ">gv") -- Indent right
map("i", "jk", "<Esc>") -- Escape
map("i", "kj", "<Esc>") -- Escape
map("v", "<leader>r", '"hy:%s/<C-r>h/', { noremap = true, silent = false, desc = "[R]eplace text" })

-- Buffer management
map("n", "<leader>bd", function()
	vim.cmd("%bd")
	vim.cmd("e#")
end, { noremap = true, silent = true, desc = "Close all buffers" })
map("n", "<Tab>", function()
	vim.cmd("w")
	vim.cmd("bnext")
end) -- Buffer next
map("n", "<S-Tab>", function()
	vim.cmd("w")
	vim.cmd("bprevious")
end) -- Buffer next

-- Using the void register
map("n", "<leader>d", '"_d', { noremap = true, silent = false, desc = "[D]elete to void" })
map("v", "<leader>d", '"_d', { noremap = true, silent = false, desc = "[D]elete to void" })
map("x", "<leader>p", '"_dP', { noremap = true, silent = false, desc = "[P]aste & repeat" })

map("n", "<leader>te", function()
	vim.cmd("vsplit")
	vim.cmd("terminal")
	vim.cmd("norm i")
end, { noremap = true, silent = true, desc = "Open [T][E]rminal" })
