syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
call plug#end()

let g:user_emmet_install_global = 0
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
autocmd FileType html,css EmmetInstall
