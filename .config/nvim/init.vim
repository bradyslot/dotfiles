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
Plug 'junegunn/vim-easy-align'
Plug 'fidian/hexmode'

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

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jay-babu/mason-nvim-dap.nvim'

call plug#end()

" =================================================================== DEBUGGING

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
" nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <leader>d :lua require('dapui').toggle()<CR>

" ===================================================================== HEXMODE

let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.blob,*.a,*.so,*.dll,*.sys,*.com'
let g:hexmode_xxd_options = '-g 1'

" ===================================================================== AUTOCMD

" Spell-check Markdown files and Git Commit Messages
augroup Markdown
  autocmd!
  autocmd FileType markdown setlocal tw=80
  autocmd FileType markdown setlocal fo+=t
  autocmd FileType markdown setlocal wrap linebreak
  autocmd FileType markdown setlocal spell
augroup END

autocmd FileType gitcommit setlocal spell
" sql syntax highlighting for surrealQL files
autocmd BufNewFile,BufRead *.surql set filetype=sql

" ========================================================================= LUA

set completeopt=menu,menuone,noselect

source ~/.config/nvim/plugins/nvim-cmp.lua
source ~/.config/nvim/plugins/nvim-lspconfig.lua
source ~/.config/nvim/plugins/mason.lua
source ~/.config/nvim/plugins/dapui.lua

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

" make j and k move by display lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" lazy fast scrolling by display lines
nnoremap <S-j> 10gj
nnoremap <S-k> 10gk
vnoremap <S-j> 10gj
vnoremap <S-k> 10gk

" jump to beginning and end of display line
nnoremap <S-h> g^
nnoremap <S-l> g$


vnoremap A <Plug>(EasyAlign)

nnoremap <silent><leader>r :Ranger<CR>
nnoremap <silent><leader>w :write<CR>
" airline breaks when sourcing config
nnoremap <silent><leader>s :silent! so ~/.config/nvim/init.vim <CR>:AirlineRefresh<CR>
" nnoremap <silent><leader>x :close<CR>
nnoremap <silent><leader>q :bd<CR>

" intuitive window splitting with horizontal and vertical characters
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
vnoremap <silent><C-j> :m '>+1<CR>gv=gv
vnoremap <silent><C-k> :m '<-2<CR>gv=gv

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

" ==================================================================== COMMANDS

" write using sudo with w!!
cmap w!! w !sudo tee > /dev/null %

" enable vim-repeat support on mappings
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
