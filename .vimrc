" BASIC SETTINGS
set nocompatible
set ruler
set showcmd
set autoindent
set nocursorcolumn
set nocursorline
set number

" For display invisible characters.
" ---------------------------------
set listchars=trail:·,precedes:«,extends:»,eol:¬,tab:>·
set list

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

"set t_Co=2525 "Enable 256-color mode
set laststatus=2 " Height of status bar

" Set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

filetype off              " Disable filetype for Vundle
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'          " Vundle plugin control for vim
    Plugin 'fatih/molokai'              " Molokai colorscheme
    Plugin 'bling/vim-airline'
    Plugin 'fatih/vim-go'               " Support for Golang
    Plugin 'Shougo/neocomplete.vim'     " Support autocomplete
    Plugin 'Shougo/neosnippet'          " Support snippets
    Plugin 'Shougo/neosnippet-snippets' " Collection of snippets
    Plugin 'majutsushi/tagbar.git'
    Plugin 'scrooloose/nerdtree.git'    " Files tree panel
    Plugin 'rust-lang/rust.vim'         " Support Rust
    Plugin 'phildawes/racer'            " For autocomplete in Rust
    Plugin 'scrooloose/syntastic'       " Check syntax
call vundle#end()
filetype plugin indent on " Enable filetype for Vundle

let g:molokai_original = 1
colorscheme molokai
hi Normal ctermbg=none " This is for transparent background

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

inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" -----------------------------------------------

" Tagbar Plugin
nmap <F8> :TagbarToggle<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" -----------------------------------------------
" Syntastics Plugin
" -----------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -----------------------------------------------

" For snippet_complete marker.
if has('conceal')
   set conceallevel=2 concealcursor=i
endif
