#!/bin/bash

# Copies out SSH keys to given server and then sets up
# the environment just the way I like it.

echo "Assimilating '$1' with user '$2'!"

ssh $2@$1 'mkdir -p ~/.ssh/'
cat ~/.ssh/id_rsa.pub | ssh $2@$1 'cat >> ~/.ssh/authorized_keys'
scp ~/.ssh/id_* $2@$1:~/.ssh/  # Copy over all keys for GitHub
ssh httpd@dev 'mkdir -p dev;cd dev'
ssh httpd@dev
