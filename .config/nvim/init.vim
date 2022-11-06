set nocompatible
syntax on
filetype plugin indent on
set autoindent
set clipboard+=unnamedplus
set cmdheight=1
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
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

let g:polyglot_disabled = ['ansible']

" ===================================================================== PLUGINS

call plug#begin(stdpath('data') . '/plugged')

" colors and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
Plug 'lilydjwg/colorizer'

" floating terminal inside vim
Plug 'voldikss/vim-floaterm'

" quality of life improvements
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-suround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'yuttie/comfortable-motion.vim'
Plug 'Yggdroot/indentLine'
" Plug 'breuckelen/vim-resize'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'ggandor/leap.nvim'

" language server protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
Plug 'pearofducks/ansible-vim'
Plug 'github/copilot.vim'
" Plug 'dense-analysis/ale'

call plug#end()

" ======================================================================== LEAP

lua require('leap').add_default_mappings()

" ========================================================================= ALE

" let g:rustfmt_autosave = 1
" let g:rustfmt_emit_files = 1
" let g:rustfmt_fail_silently = 0
" let g:ale_linters = {
"       \ 'rust': ['analyzer']
" }

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

" ===================================================================== ANSIBLE

au BufRead,BufNewFile */inventory/* set filetype=ansible_hosts
au BufRead,BufNewFile */group_vars/*,*/host_vars/* set filetype=yaml.ansible
au BufRead,BufNewFile */playbooks/*.yml,*/roles/*.yml set filetype=yaml.ansible

" syntax highlighting yml is broken from launch
au BufRead,BufNewFile *.yml colorscheme onedark
au BufRead,BufNewFile *.yml :AirlineRefresh

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }

" ansible-vim
let g:ansible_attribute_highlight = 'a'
" let g:ansible_name_highlight = 'b'
" let g:ansible_extra_keyword_highlight = 1
" let g:ansible_normal_keywords_highlight = 'Constant'
" let g:ansible_loop_keywords_highlight = 'Constant'

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

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:csv_no_conceal = 1

" ========================================================================= COC

" Tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> behave properly
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent><C-k> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>cw <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" " Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<ScrollWheelDown>"
  nnoremap <silent><nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<ScrollWheelUp>"
  inoremap <silent><nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<ScrollWheelDown>"
  vnoremap <silent><nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<ScrollWheelUp>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" ================================================================== INDENTLINE

" fix conceallevel issue with json and markdown
" conceal is quite literally the shittiest feature of any program in existence
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0
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

" autoclose in insert mode
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>

" Close split window before closing buffer
function CloseWindowThenBuffer()
  try
    :close
  catch /^Vim\%((\a\+)\)\=:E444/
    :bd
  endtry
endfunction

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

" " resize windows with arrow keys
" let g:vim_resize_disable_auto_mappings = 1
" nnoremap <silent><C-Left> :CmdResizeLeft<CR>
" nnoremap <silent><C-Right> :CmdResizeRight<CR>
" nnoremap <silent><C-Up> :CmdResizeUp<CR>
" nnoremap <silent><C-Down> :CmdResizeDown<CR>

" " move between windows
" nnoremap <silent><leader>h :wincmd h<CR>
" nnoremap <silent><leader>j :wincmd j<CR>
" nnoremap <silent><leader>k :wincmd k<CR>
" nnoremap <silent><leader>l :wincmd l<CR>

" remap joining lines and opening help
nnoremap <C-j> J
nnoremap <C-k> K

" move lines around
vnoremap <silent>J :m '>+1<CR>gv=gv
vnoremap <silent>K :m '<-2<CR>gv=gv
" inoremap <silent><C-j> <esc>:m .+1<CR>==
" inoremap <silent><C-k> <esc>:m .-2<CR>==
" nnoremap <silent><leader>j :m .+1<CR>==
" nnoremap <silent><leader>k :m .-2<CR>==

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
