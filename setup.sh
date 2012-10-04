#!/bin/bash

rm ~/.vimrc
rm ~/.screenrc 

# Create the proper symlinks
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/screenrc ~/.screenrc
