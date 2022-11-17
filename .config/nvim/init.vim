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
set number
set relativenumber
set scrolloff=999
set shiftwidth=2
set shortmess+=c
set showcmd
set sidescrolloff=999
set smartindent
set tabstop=2 softtabstop=2
set termguicolors
set updatetime=50
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ===================================================================== PLUGINS

call plug#begin(stdpath('data') . '/plugged')

" colors and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'lilydjwg/colorizer'

" quality of life improvements
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-suround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'yuttie/comfortable-motion.vim'
Plug 'Yggdroot/indentLine'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'ggandor/leap.nvim'

" language server protocol
Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'

call plug#end()

" ======================================================================== LEAP

lua require('leap').add_default_mappings()

" remove leaps use of x in visual mode
lua vim.keymap.del({'x', 'o'}, 'x')
lua vim.keymap.del({'x', 'o'}, 'X')

" ========================================================================= ALE
"
set completeopt=menu,menuone,preview,noselect,noinsert
autocmd BufNewFile,BufRead *.rs set filetype=rust

let g:ale_linters = { 'rust': ['analyzer'] }
" let g:ale_fixers = { 'rust': ['rustfmt'] }

" disable pesky missing unsafe macro warning
let g:ale_rust_analyzer_config = { "rust-analyzer.diagnostics.disabled": [ "missing-unsafe" ] }

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'


nmap <silent>gd :ALEGoToDefinition<CR>
nmap <silent>gr :ALEFindReferences<CR>

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
" make winddow seperator crispy
highlight WinSeparator guibg=None

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_symbols_ascii = 1

" ==================================================================== POLYGLOT

" conceal is quite literally the shittiest feature of any program in existence
" fix conceallevel issue with json and markdown
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:csv_no_conceal = 1

" ================================================================== INDENTLINE

let g:indentLine_char = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 1

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

let g:mapleader = ' '

nnoremap <silent><leader>r :FloatermNew ranger<CR>
nnoremap <silent><leader>g :FloatermNew lazygit<CR>
nnoremap <silent><leader>w :write<CR>
" airline breaks when sourcing config
nnoremap <silent><leader>s :silent! so ~/.config/nvim/init.vim <CR>:AirlineRefresh<CR>
nnoremap <silent><leader>x :close<CR>
nnoremap <silent><leader>c :bd<CR>

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
nnoremap <C-j> J
nnoremap <C-k> K

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

" jump to begining and end of line
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
