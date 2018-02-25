call pathogen#infect()

" Autorun some plugins (github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
unlet g:plug_url_format
Plug 'kreeger/benlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" set laststatus=2 for airline
set laststatus=0
let g:airline_theme='badcat'

set background=dark
set t_Co=256
colorscheme benlight

set ai
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set syntax=on
set ruler

" Turn off match paren
let loaded_matchparen=1

filetype indent on
filetype plugin on  
let g:go_disable_autoinstall = 0 
autocmd BufRead,BufNewFile  *.mk,Makefile set noexpandtab
au BufRead,BufNewFile *.go set filetype=go 
