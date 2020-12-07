syntax enable 
filetype plugin on
set relativenumber
set mouse=a
set showcmd
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
set scrolloff=999
set noshowmode
set clipboard=unnamedplus
set colorcolumn=80
set cmdheight=1
set shortmess+=c
set updatetime=50
set completeopt=menuone,noinsert,noselect
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin(stdpath('data') . '/plugged')

" colors and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/limelight.vim'

" floating terminal inside vim
Plug 'voldikss/vim-floaterm'

" quality of life improvements
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" language extensions
Plug 'rust-lang/rust.vim'
 
" ranger file manager
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

call plug#end()

" open ranger when vim opens a directory
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" set colorscheme
" let base16colorspace=256 
" colorscheme base16-nord
let g:airline_theme='nord'
colorscheme nord

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
let g:floaterm_shell='zsh'
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
nnoremap <silent><F9>  :FloatermNew<CR>
tnoremap <silent><F9>  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent><F10>  :FloatermPrev<CR>
tnoremap <silent><F10>  <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent><F11>  :FloatermNext<CR>
tnoremap <silent><F11>  <C-\><C-n>:FloatermNext<CR>
nnoremap <silent><F12> :FloatermToggle<CR>
tnoremap <silent><F12> <C-\><C-n>:FloatermToggle<CR>

" FZF configuration
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 }}

" buffer search
nnoremap // :BLines<CR>

" project search
nnoremap <Leader>p :GFiles<CR>

" file search
nnoremap <C-p> :Files<CR>

" leader keymaps
let g:mapleader = " "
nnoremap <leader>g :FloatermNew lazygit<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :bd<CR>

" move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" move visual selection around 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" indenting line or visual selection
vnoremap > >gv
vnoremap < <gv 

" pressing v multiple times to expand selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" comment line or visual selection
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Coc jumping
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" buffer navigation
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
nnoremap L :bnext <CR>
nnoremap H :bprev <CR>

" write using sudo with w!!
cmap w!! w !sudo tee > /dev/null %
