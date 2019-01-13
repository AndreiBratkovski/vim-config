" Andrei Bratkovski - 2018 Vim Config
" inspired by https://realpython.com/vim-and-python-a-match-made-in-heaven/

set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" Keep Plugin commands between vundle#begin/end.
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set term=xterm-256color
" syntax on
syntax enable
set encoding=utf-8
" line settings
set nu
set number
set backspace=indent,eol,start
set cursorline

" clipboard
set clipboard=unnamed

" pep8
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 fileformat=unix expandtab autoindent cursorcolumn

" frontend
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2 softtabstop=2 shiftwidth=2

" flag whitespace
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" YCM settings, remove autocomplete preview window and goto hotkey
let mapleader=" "
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Code Folding
set foldmethod=indent
set foldlevel=99
" Enable/Disable folding with spacebar
nnoremap <space> za
vnoremap <space> zf
let g:SimpylFold_docstring_preview=1

" Syntastic beginner settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" python.vim syntax highlighting
let python_highlight_all=1

" set colorscheme
set background=dark
colorscheme gruvbox

"nerdtree ignore pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']
