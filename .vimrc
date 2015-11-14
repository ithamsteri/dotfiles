" BASIC SETTINGS
set nocompatible
set ruler
set showcmd
set autoindent
set nocursorcolumn
set nocursorline
set number
set noerrorbells visualbell t_vb=

" For display invisible characters.
" ---------------------------------
"set listchars=trail:·,precedes:«,extends:»,eol:¬,tab:>·
"set list

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
set laststatus=2 " Height of status bar (need for Airline plugin)

" Set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

filetype off              " Disable filetype for Vundle
call vundle#begin()

    " Common plugins
    Plugin 'gmarik/Vundle.vim'          " Vundle plugin control for vim
    Plugin 'fatih/molokai'              " Molokai colorscheme
    Plugin 'bling/vim-airline'          " Cool statusline in Vim
    Plugin 'scrooloose/syntastic'       " Check syntax

    " Autocomplete and snippets
    Plugin 'Shougo/neocomplete.vim'     " Support autocomplete
    Plugin 'Shougo/neosnippet'          " Support snippets
    Plugin 'Shougo/neosnippet-snippets' " Collection of snippets

    " Go language support
    Plugin 'fatih/vim-go'               " Support for Golang
    Plugin 'majutsushi/tagbar.git'      " Class panel
    Plugin 'scrooloose/nerdtree.git'    " Files tree panel

    " Rust language support
    Plugin 'rust-lang/rust.vim'         " Support Rust
    Plugin 'phildawes/racer'            " For autocomplete in Rust

    " HTML/CSS Support
    Plugin 'mattn/emmet-vim'            " Emmet plugin for HTML/CSS fast development
    Plugin 'wavded/vim-stylus'          " Stylus CSS preprocessor syntax

    " JavaScript support
    Plugin 'wookiehangover/jshint.vim'  " JSLint plugin

    " Dockerfile support
    Plugin 'ekalinin/Dockerfile.vim'    " Support for Dockerfile
call vundle#end()
filetype plugin indent on " Enable filetype for Vundle

"******************************"
" Molokai colorscheme settings "
"******************************"
    let g:molokai_original = 1
    " Set Molokai colorscheme
    colorscheme molokai
    " Set transparent background
    hi Normal ctermbg=none

"****************"
" Airline Plugin "
"****************"
    let g:airline_powerline_fonts = 1   " use symbols from fonts for Powerline

"************************"
" Vim-go plugin settings "
"************************"
    let g:go_highlight_operators = 1        " Heghlights operators such as :=, ==, -=, etc
    let g:go_highlight_functions = 1        " Enable highlight for functions
    let g:go_highlight_methods = 1          " Enable highlight for methods
    let g:go_highlight_structs = 1          " Enable highlight for structs
    let g:go_highlight_build_constraints = 1
    let g:go_auto_type_info = 1
    let g:go_snippet_engine = "neosnippet"  " I use neosnippet plugin for snippets

    " Set keymappings
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>r <Plug>(go-rename)

"*****************************"
" NeoComplete plugin settings "
"*****************************"
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    "let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " Need for auto close preview buffer
    let g:neocomplete#enable_auto_close_preview = 1 

    " Set keymappings
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

"****************************"
" NeoSnippet plugin settings "
"****************************"
    " Set keymappings
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

    " For conceal markers.
    if has('conceal')
        set conceallevel=2 concealcursor=niv
    endif

    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1

"************************"
" Tagbar plugin settings "
"************************"
    nmap <F8> :TagbarToggle<CR>

"**************************"
" NerdTree plugin settings "
"**************************"
    map <C-n> :NERDTreeToggle<CR>

"****************************"
" Syntastics plugin settings "
"****************************"
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

