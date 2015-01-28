#!/bin/bash

#run this in your .vim directory
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpope/pathogen.vim
mkdir -p bundle
cd bundle
git clone https://github.com/fatih/vim-go.git
