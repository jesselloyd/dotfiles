" ===============  Begin Basics  ===============

set nocompatible
set title
set number

set noswapfile
set nobackup
set nowritebackup

set splitright
set splitbelow

set hidden
set path+=/usr/local/include

set scrolloff=3
set visualbell
set noerrorbells

set autoread

set noshowmode
set signcolumn=yes
set shortmess+=c

" Color scheme
if (has('termguicolors'))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
syntax enable
set background=dark

" Wild menu settings for showing command option
" completion lists right above the status line.
set wildmenu
set wildmode=longest:full,full

" Allows use of the system cliboard for yank/paste.
set clipboard^=unnamed,unnamedplus

" Remap normal mode to jk.
inoremap jk <ESC>
inoremap kj <ESC>
inoremap <ESC> <NOP>

" Remap terminal model quit to escape.
tnoremap <Esc> <C-\><C-n>

" Show the mouse in normal and visual mode only.
set mouse=nv

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

" (macOS) Fix against disabling arrow keys in insert and normal mode.
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" (macOS) Move selected lines up (ALT + K)  and down (ALT + J).
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <ESC>:m .+1<CR>==gi
inoremap ˚ <ESC>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Show line highlight when in insert mode.
autocmd InsertEnter,InsertLeave * set cul!

" Return to last edit position when opening files.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Window tabs navigation.
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<SPACE>
nnoremap td :tabclose<CR>

" ===============   End Basics   ===============

" =============== Begin Tab/Bksp ===============

" Use spaces instead of tabs.
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

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

" Deactivate highlighted matching terms on double enter press.
nnoremap <CR> :noh<CR><CR>

" ===============   End Search   ===============

call plug#begin()

" File search and navigation.
Plug 'junegunn/fzf'
Plug 'jremmen/vim-ripgrep'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File tree and file status line.
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Editor utilities.
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Completions and code diagnostics tools.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes.
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'
Plug 'sonph/onehalf'


" Languages.
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Editor configuration.
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" =============== End Vim-Plug =================

" =============== Begin NERDTree ===============

map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" Close Vim if NERDTree is the only window open.
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" Open README.md in current directory if exists.
" autocmd VimEnter * if filereadable(expand('README.md')) | edit README.md | endif

" ===============  End NERDTree  ===============

" ===============  Begin Fzf  ==================

nnoremap <C-p> :FZF<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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

" Hide statusline when opening fzf window.
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ===============  End Fzf =====================

" ============ Begin GitGutter =================

" used to ensure GitGutter updates responsively.
set updatetime=100

" ============= End GitGutter ==================

" ========= Start Syntax mappings =============

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.cs setlocal shiftwidth=4 softtabstop=4 expandtab

" ========= End Syntax mappings ===============

" ============= Start EditorConfig ============

let g:EditorConfig_core_mode = 'external_command'

" ============= End EditorConfig ==============

" ============== Begin Airline =================

" let g:airline_theme = 'monokai'

" ==============  End Airline  =================

" =============== Begin Coc ====================

" Use tab for trigger completion with characters ahead and navigate.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use `complete_info` when selecting a completion from triggered list.
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <lug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word.
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup formatting
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, 
" ex: `<leader>aap` for current paragraph.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, 
" requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, 
" like: coc-tsserver, coc-python.
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Use `:OR` for organize import of current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, 
" checkout `:h coc-status`.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use CocList to show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ===============  End Coc  ====================

colorscheme monokai
set re=0
autocmd BufEnter * syntax sync fromstart

