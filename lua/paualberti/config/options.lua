-- tab / indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- appearance
vim.opt.title = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10
vim.opt.cursorline = false
vim.opt.colorcolumn = "0"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.wrap = false
vim.opt.inccommand = "split"
vim.opt.pumheight = 5
vim.opt.showtabline = 0
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait400-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- behaviour
vim.opt.confirm = true
vim.opt.updatetime = 100
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
