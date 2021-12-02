#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
rm -v ~/.bashrc
rm -v ~/.bash_aliases

# tmux
rm -v ~/.tmux.conf

# vim
rm -v ~/.vimrc
echo 'removed directory: ‘/home/redhat/.vim/bundle/‘'
rm -vrf ~/.vim/bundle/

# git
rm -v ~/.gitconfig
rm -v ${BASEDIR}/git/.gitconfig

# zsh
#rm -v ~/.zshrc
