-- disable auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- enable italic comments
vim.api.nvim_create_autocmd("BufEnter", { command = [[highlight Comment cterm=italic gui=italic]] })

-- delete trailing whitspaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function() vim.highlight.on_yank() end,
})

-- go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = cursorGrp,
})
vim.api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)
