" ===============  Begin Basics  ===============

set nocompatible
set title 
set number
set noswapfile
set nobackup
set splitright
set splitbelow
set hidden
set path+=/usr/local/include
set scrolloff=3

" Color scheme  
set background=dark
colorscheme gruvbox
syntax on

" Wild menu settings for showing command option 
" completion lists right above the status line
set wildmenu
set wildmode=longest:full,full

" Allows use of the system cliboard for yank/paste
set clipboard=unnamed

" Remap normal mode to jk 
inoremap jk <ESC>
inoremap <ESC> <NOP>

" Show the mouse in normal and visual mode only
set mouse=nv

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

" macOS fix against disabling arrow keys in insert and normal mode
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" Move selected lines up (alt + k)  and down (alt + j)
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <ESC>:m .+1<CR>==gi
inoremap ˚ <ESC>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Highlight current line in insert mode
autocmd InsertEnter,InsertLeave * set cul!
let CursorColumnI = 0 
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Window tabs navigation
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<SPACE>
nnoremap td :tabclose<CR>

" ===============   End Basics   ===============

" =============== Begin Tab/Bksp ===============
"
" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent 

set backspace=eol,start,indent

" ===============  End Tab/Bksp  ===============

" ===============  Begin Search  ===============

set hlsearch
set ignorecase
set smartcase
set incsearch

nnoremap s :Rg<SPACE>

" ===============   End Search   ===============

" ===============  Begin ALE  ==================

let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Map Goto definition to open in a new Vsplit window
nnoremap gd :vsplit \| ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>

" ===============  End ALE  ====================

" =============== Start Vim-Plug ===============

call plug#begin('~/.vim/plugged')

" File search and navigation
Plug 'junegunn/fzf'
Plug 'jremmen/vim-ripgrep'

" Git 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File tree and file status line
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Completions and code diagnostics tools
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'shougo/echodoc'

" Themes 
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

call plug#end()

" =============== End Vim-Plug =================

" =============== Begin NERDTree ===============

map <C-n> :NERDTreeToggle<CR>

" Close Vim if NERDTree is the only window open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autostart NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ===============  End NERDTree  ===============

" ===============  Begin Fzf  ==================

nnoremap <C-p> :FZF<CR>

" Use ripgrep with fzf
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

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

" ===============  End Fzf =====================

" ============  Begin SuperTab  ================

let g:SuperTabDefaultCompletionType = "context"

" =============  End SuperTab  =================

" ============ Begin GitGutter =================

" used to ensure GitGutter updates responsively
set updatetime=100

" ============= End GitGutter ==================

" ============ Begin EchoDoc ===================

let g:echodoc_enable_at_startup = 1
set noshowmode
set shortmess+=c

" ============= End EchoDoc ==================== 

" =============  Start Vue =====================

autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.vue setf vue

" ==============  End Vue ======================

