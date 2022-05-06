set background=dark
set t_Co=256
let &t_Co=256
colorscheme benlight

set ai
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set syntax=on
set ruler
syntax enable

" Turn off match paren
let loaded_matchparen=1

filetype indent on
filetype plugin on  
let g:go_disable_autoinstall = 0 
autocmd BufRead,BufNewFile  *.mk,Makefile set noexpandtab
au BufRead,BufNewFile *.go set filetype=go 
