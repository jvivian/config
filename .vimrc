" Basic Settings ==================================
let mapleader = "'"
" Line Numbers
set number
set relativenumber
set t_Co=256
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>


" Plugin section
call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'jnurmine/Zenburn'
" File Browser
Plug 'preservim/nerdtree'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Comment out stuff
Plug 'tpope/vim-commentary'
" Status bar
Plug 'vim-airline/vim-airline'
" Fast folding
Plug 'Konfekt/FastFold'

" Python Extensions
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Linting
" Plug 'dense-analysis/ale'
" Black formatting
Plug 'psf/black', { 'branch': 'stable' }
" Jupyter sync
Plug 'untitled-ai/jupyter_ascending.vim'
" Syntax highlighting
Plug 'sheerun/vim-polyglot'
" Auto pairing of parentheses
Plug 'tmsvg/pear-tree'
" Indent guides
Plug 'nathanaelkane/vim-indent-guides'
" Import sort (via :Isort)
Plug 'fisadev/vim-isort'
" Ipython plugins
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" Folding
Plug 'tmhedberg/SimpylFold'

call plug#end()

" Plugin Configuration ============================
" fzf
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>

" CoC Autocomplete
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Mappings for vim-ipython-cell and vim-slime
" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>
" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>
" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>
" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>
" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" Jupyter ascending
nmap <Leader>x <Plug>JupyterExecute
nmap <Leader>X <Plug>JupyterExecuteAll

" Nerdtree configuration
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" toggle nerd tree \f
nnoremap <Leader>n :NERDTreeToggle<CR>


" Misc Configuration =================================================
" Colorscheme ---------------
colors zenburn
" Python configuration ------
" PEP 8
autocmd BufWritePre *.py execute ':Black'

