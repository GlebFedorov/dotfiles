call plug#begin('~/.vim/plugged')
Plug 'Rigellute/rigel'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/xavierd/clang_complete'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:clang_library_path='/usr/lib/llvm-9/lib'

set termguicolors
syntax enable
colorscheme rigel 
let g:rigel_airline = 1
let g:airline_theme = 'rigel'
set number
set clipboard+=unnamed
set clipboard=unnamedplus
set clipboard=unnamed

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
