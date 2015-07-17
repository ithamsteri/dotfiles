" BASIC SETTINGS
set nocompatible
set ruler
set showcmd
set autoindent
set nocursorcolumn
set nocursorline
set number

" size of a hard tabstop
set tabstop=4
" size of an 'indent'
set shiftwidth=4
" a combination of spaces and tabs are used to simulate
" tab stops at a width other than the (hard)tabstop
set softtabstop=4
" make 'tab' insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab

syntax sync minlines=256
syntax enable

set t_Co=2525 "Enable 256-color mode
set laststatus=2 " Height of status bar

" Set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

filetype off              " Disable filetype for Vundle
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'file:///home/hamsteri/.vim/my/vimbrant'
    Plugin 'fatih/molokai'
    Plugin 'bling/vim-airline'
    Plugin 'fatih/vim-go'
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'Shougo/neosnippet'
    Plugin 'Shougo/neosnippet-snippets'
    Plugin 'majutsushi/tagbar.git'
    Plugin 'scrooloose/nerdtree.git'
call vundle#end()
filetype plugin indent on " Enable filetype for Vundle

let g:molokai_original = 1
colorscheme molokai

" Airline Plugin
" use symbols from fonts for Powerline
let g:airline_powerline_fonts = 1

" Go Vim
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" -----------------------------------------------
" NeoComplete Plugin
" -----------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Tagbar Plugin
nmap <F8> :TagbarToggle<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
   set conceallevel=2 concealcursor=i
endif
