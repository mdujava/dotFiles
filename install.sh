#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sv ${BASEDIR}/vim/.vimrc ~/.vimrc
ln -sv ${BASEDIR}/vim/ ~/.vim

# zsh
#ln -sv ${BASEDIR}/zshrc ~/.zshrc

# git
#ln -sv ${BASEDIR}/gitconfig ~/.gitconfig
