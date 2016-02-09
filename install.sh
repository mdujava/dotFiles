#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sv ${BASEDIR}/vim/.vimrc ~/.vimrc
ln -sv ${BASEDIR}/vim/ ~/.vim

# bash
ln -sv ${BASEDIR}/bash/.bashrc ~/.bashrc
ln -sv ${BASEDIR}/bash/.bash_aliases ~/.bash_aliases

# zsh
#ln -sv ${BASEDIR}/zshrc ~/.zshrc

# git
#ln -sv ${BASEDIR}/gitconfig ~/.gitconfig
