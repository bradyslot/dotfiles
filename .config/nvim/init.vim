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
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
let $MYVIMRC="~/.vimrc"
set updatetime=50
set shortmess+=c
set colorcolumn=80
set cmdheight=2
set buftype=help
highlight ColorColumn ctermbg=0 guibg=lightgrey

" avoid issues with nvim's shada file
if !has('nvim')
    set viminfo+=n~/.vim/viminfo
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'

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

" fzf configuration
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" improve tabbing 
let g:airline#extensions#tabline#enabled = 1
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" key bindings 
let g:mapleader = " "
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :FloatermNew lazygit<CR>
nnoremap <leader>r :FloatermNew ranger<CR>
nnoremap <leader><Tab> :bd<CR>
nnoremap <leader>s :w<CR>
vnoremap <leader>p "_dP
noremap <C-_> :Commentary<CR>
vnoremap > >gv
vnoremap < <gv
