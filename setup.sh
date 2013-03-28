#!/bin/bash

rm ~/.vimrc
rm ~/.screenrc 
rm ~/.gitconfig

# Create the proper symlinks
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/screenrc ~/.screenrc
ln -s `pwd`/gitconfig ~/.gitconfig

cp -a bin/* ~/bin/
cp -a vim/* ~/.vim/
