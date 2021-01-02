syntax on
filetype plugin indent on
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
set colorcolumn=81
set cmdheight=1
set shortmess+=c
set updatetime=50
set completeopt=menuone,noinsert,noselect
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ===================================================================== PLUGINS

call plug#begin(stdpath('data') . '/plugged')

" colors and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'

" floating terminal inside vim
Plug 'voldikss/vim-floaterm'

" quality of life improvements
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'

" language extensions
Plug 'neoclide/coc.nvim'

call plug#end()

" ========================================================================= COC

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" ================================================================= COLORSCHEME

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='base16'
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.linenr=''
let g:airline_section_y=''
colorscheme base16-solarflare

" solarflare theme
if has('nvim')
    let g:terminal_color_0  = '#18262f'
    let g:terminal_color_1  = '#ef5253'
    let g:terminal_color_2  = '#7cc844'
    let g:terminal_color_3  = '#e4b51c'
    let g:terminal_color_4  = '#33b5e1'
    let g:terminal_color_5  = '#a363d5'
    let g:terminal_color_6  = '#52cbb0'
    let g:terminal_color_7  = '#a6afb8'
    let g:terminal_color_8  = '#667581'
    let g:terminal_color_9  = '#ef5253'
    let g:terminal_color_10 = '#7cc844'
    let g:terminal_color_11 = '#e4b51c'
    let g:terminal_color_12 = '#33b5e1'
    let g:terminal_color_13 = '#a363d5'
    let g:terminal_color_14 = '#52cbb0'
    let g:terminal_color_15 = '#f5f7fa'
endif

" ====================================================================== RANGER

" open ranger when vim opens a directory
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0

" ==================================================================== POLYGLOT

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

" ==================================================================== FLOATERM

let g:floaterm_shell='zsh'
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.9
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" ========================================================================= FZF

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 }}

" buffer search
nnoremap // :BLines<CR>
" project search
nnoremap <Leader>p :GFiles<CR>
" file search
nnoremap <C-p> :Files<CR>

" ====================================================================== LEADER

let g:mapleader = " "
nnoremap <leader>g :FloatermNew lazygit<CR>
nnoremap <leader>r :FloatermNew ranger<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :bd<CR>
nnoremap <leader>c :Colors<CR>

" move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" ====================================================================== REMAPS

" move visual selection around
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

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
nnoremap <C-h> :bprev <CR>
nnoremap <C-l> :bnext <CR>

" jump to begining and end of line
nnoremap <S-h> ^
nnoremap <S-l> $

" ==================================================================== COMMANDS

" write using sudo with w!!
cmap w!! w !sudo tee > /dev/null %
