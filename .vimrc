let mapleader = " "
let g:netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

"""""""""""
" AutoCmd "
"""""""""""

" Disable auto comment on new line
autocmd BufEnter * set formatoptions-=cro

" Resize splits when terminal is resized
autocmd VimResized * wincmd =

" Delete trailing whitespace on save
function! DeleteTrailingWhitespace()
    let save_cursor = getpos(".")
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call DeleteTrailingWhitespace()

" Highlight yanked text
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

" Return to last edit position when reopening file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Show cursorline only in the active window
augroup CursorLine
    autocmd!
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
augroup END

"""""""""""
" Keymaps "
"""""""""""

" Diagnostic quick-fix keymap
nnoremap <silent> <leader>q :lua vim.diagnostic.setloclist()<CR>

" Exit terminal mode with <Esc> (may not work in all setups)
tnoremap <Esc> <C-\><C-n>

" Various useful mappings
nnoremap j gj
nnoremap k gk
nnoremap Y yg$
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap Q <nop>
inoremap <C-c> <Esc>
" nnoremap <leader>bd :%bd | e#<CR>
nnoremap <C-Up> <C-w>3+
nnoremap <C-Down> <C-w>3-
nnoremap <C-Right> <C-w>3>
nnoremap <C-Left> <C-w>3<

vnoremap < <gv
vnoremap > >gv
vnoremap <leader>r "hy:%s/<C-r>h//g<Left><Left>

" Move selected lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Don’t yank deleted text
vnoremap <leader>d "_d
nnoremap x "_x
xnoremap <leader>p "_dP

" Open file explorer
nnoremap <leader>e :Ex<CR>

" Temporary highlight search
nnoremap <silent> <leader>hl :call Temporary_hlsearch(3)<CR>

" Open terminal in a split
"nnoremap <silent> <leader>to :vsplit | terminal | startinsert<CR>

" Go to next diagnostic
" inoremap <C-d> :lua vim.diagnostic.goto_next({float = false})<CR> :normal! "_diw<CR>

"""""""""""
" Options "
"""""""""""

" Tab and indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set breakindent

" Search settings
set incsearch
set ignorecase
set smartcase
set nohlsearch

" Appearance settings
set notitle
set number
set relativenumber
set scrolloff=8
set sidescrolloff=10
set nocursorline
set colorcolumn=0
set termguicolors
set signcolumn=no
set showmode
set cmdheight=1
set laststatus=2
set nowrap
" set inccommand=split
set pumheight=5
set showtabline=0
set guicursor=n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait400-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Behavior settings
set confirm
set updatetime=100
set timeoutlen=500
set autoread
set nohidden
set noerrorbells
set noswapfile
set nobackup
"set undodir=~/.vim/undodir
"set undofile
set backspace=indent,eol,start
set splitright
set splitbelow
set noautochdir
set iskeyword+=-
set mouse=
set clipboard=
" set modifiable
set encoding=UTF-8

