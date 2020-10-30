syntax enable 
filetype plugin on
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set clipboard=unnamedplus
set updatetime=50
set shortmess+=c
set colorcolumn=80
set cmdheight=2
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin(stdpath('data') . '/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let base16colorspace=256 
colorscheme base16-snazzy
let g:airline_theme='base16_snazzy'

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" floaterm config
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_keymap_toggle='<F12>'
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" FZF configuration
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 }}

" Bind "//" to a fzf-powered buffer search
nmap // :BLines<CR>

" Bind "??" to a fzf-powered project search
nmap ?? :Rg<CR>

" Bind "<C-p>" to a fzf-powered filename search
nmap <C-p> :Files<CR>

" Bind "cc" to a fzf-powered command search
nmap cc :Commands<CR>

" leader keymaps
let g:mapleader = " "
nnoremap <leader>g :FloatermNew lazygit<CR>
nnoremap <leader>r :FloatermNew ranger<CR>
nnoremap <leader>x :bd<CR>
nnoremap <leader>s :w<CR>
vnoremap <leader>p "_dP
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" comment line or visual selection
noremap <C-_> :Commentary<CR>

" indenting line or visual selection
vnoremap > >gv
vnoremap < <gv

" Coc jumping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" buffer navigation
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
noremap <S-l> :bnext <CR>
noremap <S-h> :bprev <CR>

" tab navigation
noremap <C-Left> :tabprevious<CR>
noremap <C-Right> :tabnext<CR>
