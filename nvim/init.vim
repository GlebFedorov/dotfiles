set number
syntax on
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

if (empty($TMUX))
	  if (has("nvim"))
		      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		        endif
			  if (has("termguicolors"))
				      set termguicolors
				        endif
				endif

set background=light        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
let g:airline_theme='one'
set clipboard+=unnamed
set clipboard=unnamedplus
set clipboard=unnamed
