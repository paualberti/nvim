""""""""""""""""
" Autocommands "
""""""""""""""""

" Disable auto comment on new line
autocmd BufEnter * set formatoptions-=cro

" Resize splits when the terminal is resized
autocmd VimResized * wincmd =

" Delete trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" Highlight text on yank
augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" Go to last location when opening a buffer
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"""""""""""
" Keymaps "
"""""""""""

" Diagnostic keymaps
nnoremap <silent> <leader>q :lua vim.diagnostic.setloclist()<CR>

" Exit terminal mode with <Esc>
tnoremap <Esc> <C-\><C-n>

" Useful keymaps
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
nnoremap <leader><leader> <Esc>

" Window resizing
nnoremap <C-Up> <C-w>5+
nnoremap <C-Down> <C-w>5-
nnoremap <C-Right> <C-w>5>
nnoremap <C-Left> <C-w>5<

" Better navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" Rename in visual mode
vnoremap <leader>r "hy:%s/<C-r>h/

" Move selected text in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Avoid yanking deleted text
nnoremap x "_x
xnoremap <leader>p "_dP

"""""""""""
" Options "
"""""""""""

" Tabs and indentation
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

" Appearance
set notitle
set number
set relativenumber
set scrolloff=8
set sidescrolloff=0
set nocursorline
set colorcolumn=80
set termguicolors
set signcolumn=yes
set showmode
set cmdheight=1
set laststatus=2
set wrap
set inccommand=split
set pumheight=5
set showtabline=0
set guicursor=n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait400-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Behavior
set confirm
set updatetime=100
set timeoutlen=500
set autoread
set nohidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set backspace=indent,eol,start
set splitright
set splitbelow
set noautochdir
set iskeyword+=-
set mouse=
set clipboard=
set modifiable
set encoding=UTF-8
