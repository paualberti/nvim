local map = function(mode, lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "[Q]uick_Fix" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
map("t", "<esc>", "<c-\\><c-n>")

-- Useful keymaps
map("n", "j", "gj") -- Visual j
map("n", "k", "gk") -- Visual k
map("n", "Y", "yg$") -- Yank till eol
map("n", "J", "mzJ`z") -- Join lines
map("n", "<c-d>", "<c-d>zz") -- Center view
map("n", "<c-u>", "<c-u>zz") -- Center view
map("n", "n", "nzzzv", { noremap = true, silent = false }) -- Center view
map("n", "N", "Nzzzv", { noremap = true, silent = false }) -- Center viewkey
map("n", "Q", "<nop>") -- Disable Q
map("i", "<c-c>", "<esc>") -- Standardize <esc>
map("n", "<leader><leader>", "<esc>") -- Disable <space>
map("n", "<c-Up>", "<c-w>5+") -- Increase window height
map("n", "<c-Down>", "<c-w>5-") -- Decrease window height
map("n", "<c-Right>", "<c-w>5>") -- Increase window width
map("n", "<c-Left>", "<c-w>5<") -- Decrease window width

-- Better navigation
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

map("v", "<", "<gv") -- Indent left
map("v", ">", ">gv") -- Indent right
map("v", "<leader>r", '"hy:%s/<c-r>h/', { noremap = true, silent = false, desc = "[R]ename" })

-- Move selected line / block of text in visual mode
map("v", "J", ":m'>+1<cr>gv=gv")
map("v", "K", ":m'<-2<cr>gv=gv")

-- Don't yank deleted text
map({ "n", "v" }, "x", '"_x')
