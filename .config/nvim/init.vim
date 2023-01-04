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
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'lilydjwg/colorizer'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'mhinz/vim-startify'

" quality of life improvements
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'ggandor/leap.nvim'
Plug 'mbbill/undotree'
Plug 'lukas-reineke/indent-blankline.nvim'

" Dependencies
Plug 'nvim-lua/plenary.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'

" Search
Plug 'junegunn/fzf.vim'

" AI Assistant
Plug 'github/copilot.vim'
" Plug 'dense-analysis/neural'
" Plug 'elpiloto/significant.nvim'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" LSP Package Manager
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

" LSP UI
Plug 'glepnir/lspsaga.nvim'

" Linting
Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()

" ========================================================================= LUA

set completeopt=menu,menuone,noselect

source ~/.config/nvim/plugins/null-ls.lua
source ~/.config/nvim/plugins/nvim-cmp.lua
source ~/.config/nvim/plugins/lspsaga.lua
source ~/.config/nvim/plugins/mason.lua
" source ~/.config/nvim/plugins/neural.lua

lua local luasnip = require('luasnip')
lua require('gitsigns').setup()

" ============================================================ INDENT-BLANKLINE

" conceal is quite literally the shittiest feature of any program in existence
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:csv_no_conceal = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 1

lua vim.opt.list = true
lua require("indent_blankline").setup {}

" ==================================================================== UNDOTREE

if has('persistent_undo')
  let target_path = expand('~/.cache/undodir')

  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
      call mkdir(target_path, 'p', 0700)
  endif

  let &undodir=target_path
  set undofile
endif

nmap <silent><leader>u :UndotreeToggle<CR> :UndotreeFocus<CR>

" ========================================================================= GIT

let g:gitgutter_sign_column_always = 1
nmap <leader>g :G<CR>
" nmap <leader>gs :G status<CR>
" nmap <leader>gd :G diff<CR>
" nmap <leader>gc :G commit<CR>
" nmap <leader>gp :G push<CR>
" nmap <leader>gl :G pull<CR>

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

" ======================================================================== YAML

" Fix auto-indentation for YAML files
augroup yaml_fix
  autocmd!
  autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

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

" ==================================================================== FLOATERM

let g:floaterm_shell='zsh'
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=1.0
let g:floaterm_height=1.0
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_opener='edit'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" ====================================================================== REMAPS

nnoremap <silent><leader>r :FloatermNew ranger<CR>
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

" remap joining lines and opening help
nnoremap <silent><C-j> :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
" nnoremap <C-j> J
" nnoremap <C-k> K

" move lines around in visual mode
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

" shift j k to 10j 10k
nnoremap <S-j> 10j
nnoremap <S-k> 10k

" ==================================================================== COMMANDS

" write using sudo with w!!
cmap w!! w !sudo tee > /dev/null %

" enable vim-repeat support on mappings
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
