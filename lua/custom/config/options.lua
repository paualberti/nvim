vim.cmd("let g:netrw_liststyle = 3") -- Tree style default explorer

-- Tab / Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Appearance
vim.opt.title = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.wrap = true
vim.opt.inccommand = "split"
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait400-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Behaviour
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.autoread = true
vim.opt.hidden = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.mouse = ""
vim.opt.clipboard = ""
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
