#!/bin/bash

rm ~/.vimrc
rm ~/.screenrc 
rm ~/.gitconfig
rm ~/.vim

# Create the proper symlinks
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/screenrc ~/.screenrc
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/vim ~/.vim

cp -a bin/* ~/bin/
