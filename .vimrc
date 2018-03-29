" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Alexander Yashkin
"

" Настройка UTF-8 кодировки
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" отключаем совместимость с редактором vi
set nocompatible
" включаем автоотступ при переходе на новую строку
set autoindent
" включаем умные отступы для языка Си
set smartindent

" настраиваем размер табуляции и замену табуляции на пробелы
set tabstop=2       " ширина табуляции = 4 пробела
set shiftwidth=2    " размер отступа = 4 пробела
set expandtab       " заменяем табуляцию пробелами

" ограничиваем ширину текста в 120 символов.
set textwidth=120
" включаем отображение нумерацию строк
set number
" включаем подсветку скобок
set showmatch
" вкючаем автоматическое изменение файла
set autoread

" включаем пакетный менеджер Pathogen
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" включаем тему оформления Google
syntax on
filetype plugin indent on
set t_Co=256
set background=dark
colorscheme dracula

" Fast switch windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Plugin Airline settings
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = 'Ξ'

" Plugin YCM
let g:ycm_global_ycm_extra_conf = '/home/hamsteri/.vim/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Plugin vim-clang-format
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable

