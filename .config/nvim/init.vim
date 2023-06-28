set nocompatible
syntax on
filetype plugin indent on
set autoindent
set clipboard+=unnamedplus
set cmdheight=1
set colorcolumn=80
set conceallevel=0
set cursorline
set expandtab
set hidden
set incsearch
set list
set mouse=a
set noerrorbells
set nohlsearch
set noshowmode
set nowrap
set number relativenumber
set scrolloff=999
set scl=yes
set shiftwidth=2
set shortmess+=c
set showcmd
set sidescrolloff=999
set smartindent
set tabstop=2 softtabstop=2
set termguicolors
set updatetime=50
highlight ColorColumn ctermbg=0 guibg=lightgrey
let g:mapleader = ' '

" ===================================================================== PLUGINS

call plug#begin(stdpath('data') . '/plugged')

" colors and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" quality of life improvements
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'terryma/vim-expand-region'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'ggandor/leap.nvim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'

" Dependencies
Plug 'nvim-lua/plenary.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Search
Plug 'junegunn/fzf.vim'

" AI
Plug 'github/copilot.vim'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LSP Package Manager
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

" Linting
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'

call plug#end()

" ========================================================================= LUA

set completeopt=menu,menuone,noselect

source ~/.config/nvim/plugins/nvim-cmp.lua
source ~/.config/nvim/plugins/nvim-lspconfig.lua
source ~/.config/nvim/plugins/mason.lua

lua require('gitsigns').setup()
lua require('colorizer').setup()

" ================================================================== INDENTLINE

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" ==================================================================== UNDOTREE

set undofile
set undodir=~/.cache/undodir
set undolevels=1000
set undoreload=10000

" ========================================================================= GIT

let g:gitgutter_sign_column_always = 1

" ====================================================================== RANGER

let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

" ========================================================================= FZF

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
let g:fzf_preview_window = 'up:70%'
let g:fzf_buffers_jump = 1

nmap <leader>f :Files<CR>
nmap <leader>/ :Rg<CR>

" ======================================================================== LEAP
lua require('leap').add_default_mappings()

" remove leaps use of x in visual mode
lua vim.keymap.del({'x', 'o'}, 'x')
lua vim.keymap.del({'x', 'o'}, 'X')

" ===================================================================== COPILOT

" Use Right arrow key to accept autopilot suggestion
" this maintains the same autosuggestion behaviur i'm used to with zsh
inoremap <silent><script><expr> <Right> copilot#Accept("\<Right>")
let g:copilot_no_tab_map = v:true

" ================================================================= COLORSCHEME

set background=dark
let g:airline_theme='onedark'
colorscheme onedark

" ===================================================================== AIRLINE

" enable global status line
set laststatus=3
" make winddow separator crispy
highlight WinSeparator guibg=None

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_symbols_ascii = 1

" ====================================================================== REMAPS

nnoremap <silent><leader>r :Ranger<CR>
nnoremap <silent><leader>w :write<CR>
" airline breaks when sourcing config
nnoremap <silent><leader>s :silent! so ~/.config/nvim/init.vim <CR>:AirlineRefresh<CR>
" nnoremap <silent><leader>x :close<CR>
nnoremap <silent><leader>q :bd<CR>

" split windows
set splitright
set splitbelow
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>\ :vsplit<CR>

" resizing splits
nmap <silent><C-Left> :lua require('smart-splits').resize_left()<CR>
nmap <silent><C-Down> :lua require('smart-splits').resize_down()<CR>
nmap <silent><C-Up> :lua require('smart-splits').resize_up()<CR>
nmap <silent><C-Right> :lua require('smart-splits').resize_right()<CR>

" moving between splits
nmap <silent><leader>h :lua require('smart-splits').move_cursor_left()<CR>
nmap <silent><leader>j :lua require('smart-splits').move_cursor_down()<CR>
nmap <silent><leader>k :lua require('smart-splits').move_cursor_up()<CR>
nmap <silent><leader>l :lua require('smart-splits').move_cursor_right()<CR>

" join lines without moving cursor
nnoremap <silent><C-j> :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" move visually selected lines
vnoremap <silent>J :m '>+1<CR>gv=gv
vnoremap <silent>K :m '<-2<CR>gv=gv

" indenting line or visual selection
vnoremap > >gv
vnoremap < <gv

" pressing v multiple times to expand selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" comment line or visual selection
nnoremap <silent><C-_> :Commentary<CR>
vnoremap <silent><C-_> :Commentary<CR>

" buffer navigation
nnoremap <silent><C-h> :bprev <CR>
nnoremap <silent><C-l> :bnext <CR>

" jump to beginning and end of line
nnoremap <S-h> ^
nnoremap <S-l> $

" lazy fast scrolling
nnoremap <S-j> 10j
nnoremap <S-k> 10k

" ==================================================================== COMMANDS

" write using sudo with w!!
cmap w!! w !sudo tee > /dev/null %

" enable vim-repeat support on mappings
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
