#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
rm -v ~/.bashrc
rm -v ~/.bash_aliases

# git
rm -v ~/.gitconfig
rm -v ${BASEDIR}/git/.gitconfig

# vim
rm -v ~/.vimrc
echo 'removed directory: ‘/home/redhat/.vim/bundle/‘'
rm -rf ~/.vim/bundle/

# zsh
#rm -v ~/.zshrc
