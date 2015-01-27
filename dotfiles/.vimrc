call pathogen#infect()
set ai
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set syntax=on
set background=dark
filetype indent on
filetype plugin on  
let g:go_disable_autoinstall = 0 
colorscheme desert
autocmd BufRead,BufNewFile  *.mk,Makefile set noexpandtab
au BufRead,BufNewFile *.go set filetype=go 
