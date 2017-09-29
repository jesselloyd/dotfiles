set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" let g:deoplete#enable_at_startup = 1

" let g:deoplete#sources#rust#racer_binary= $HOME . "/.cargo/bin/racer"
" let g:deoplete#sources#rust#rust_source_path= '~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
" let g:deoplete#sources#rust#show_duplicates=1

" let g:python_host_prog = '/usr/local/lib/python2.7'
let g:python3_host_prog = '/Users/jesselloyd/anaconda/bin/python3'

autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
