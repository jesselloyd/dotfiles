" ===============  Begin Basics  ===============
set nocompatible
set title
set number
set laststatus=2
set showcmd
set showmode
set noswapfile
set nobackup
set splitright
set splitbelow

colorscheme monokaitwo
set t_Co=256

set wildmenu
set wildmode=longest:full,full
set clipboard=unnamed            
" use OS clipboard by default

set mouse=a
set esckeys
set scrolloff=3
set ruler

" Remap normal mode to jk 
imap jk <Esc>

" Disable arrow keys in insert mode
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

set path +=/usr/local/include

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" ===============   End Basics   ===============

" =============== Begin Tab/Bksp ===============

" improved tab and backspace behavior (4 spaces, backspace to line)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start

" ===============  End Tab/Bksp  ===============

" ===============  Begin Search  ===============

set hlsearch
set ignorecase
set incsearch

" ===============   End Search   ===============

" ===============  Begin Vundle  ===============

filetype off                     " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Valloric/YouCompleteMe'
" Plugin 'shougo/neocomplete.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/syntastic'

Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'cespare/vim-toml'

" Plugin 'fatih/vim-go', { 'do' : ':GoInstallBinaries' }
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'tpope/vim-rails'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leshill/vim-json'

Plugin 'rking/ag.vim'

Plugin 'majutsushi/tagbar'

Plugin 'kchmck/vim-coffee-script'

Plugin 'tpope/vim-surround'
Plugin 'justinmk/vim-syntax-extra'

Plugin 'craigemery/vim-autotag'

Plugin 'mattn/emmet-vim'

call vundle#end()                " required
filetype plugin indent on
syntax on

" ===============   End Vundle   ===============

" =============== Begin Airline  ===============

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set guifont=Source\ Code\ Pro\ for\ Powerline
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ===============  End Airline   ===============

" =============== Begin NERDTree ===============

map <C-n> :NERDTreeToggle<CR>
" Close Vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Autostart NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ===============  End NERDTree  ===============

" ============ Begin YouCompleteMe =============

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_rust_src_path = '~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'horizontal-split' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_collect_identifiers_from_tags_files = 1

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

" ============  End YouCompleteMe  =============

" ===============   Begin Rust   ===============

let g:syntastic_rust_checkers = ['cargo']
let g:rustfmt_autosave = 1

" Rust racer completion support
set hidden
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap ga <Plug>(rust-doc)

" ===============    End Rust    ===============

" ===============    Begin Go    ===============

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

" ===============     End Go     ===============

" =============== Begin Auto-{}  ===============

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" ===============  End Auto-{}   ===============

" ============  Begin Syntastic  ===============

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
au VimLeave * :!clear

" ============   End Syntastic   ===============

" =============== Begin JavaScipt =============

let g:javascript_plugin_flow = 1

let g:jsx_ext_required = 0

" =============== End JavaScript  ============

" =============== Begin Tag Bar ==============

map <C-i> :TagbarToggle<CR>

" =============== End Tag Bar ================
"
nnoremap s :Ag<SPACE>
