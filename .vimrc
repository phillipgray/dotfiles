call plug#begin('~/.vim/plugged')

" syntax highlighting!
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

colorscheme peachpuff

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
