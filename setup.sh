#!/bin/bash

rm ~/.vimrc
rm ~/.screenrc 
rm ~/.gitconfig

# Create the proper symlinks
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/screenrc ~/.screenrc
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/bin ~/bin/
#cp -a bin/* ~/bin/

cp -a vim/* ~/.vim/

# Setup some more vim plugins directly from their source
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

