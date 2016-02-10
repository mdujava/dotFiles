#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo ${BASEDIR}
echo $email

# bash
ln -sv ${BASEDIR}/bash/.bashrc ~/.bashrc
ln -sv ${BASEDIR}/bash/.bash_aliases ~/.bash_aliases

# git
touch ${BASEDIR}/git/.gitconfig
cat ${BASEDIR}/git/.gitconfig-head > ${BASEDIR}/git/.gitconfig
echo '    email =' $email >> ${BASEDIR}/git/.gitconfig
cat ${BASEDIR}/git/.gitconfig-tail >> ${BASEDIR}/git/.gitconfig
ln -sv ${BASEDIR}/git/.gitconfig ~/.gitconfig

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sv ${BASEDIR}/vim/.vimrc ~/.vimrc
vim +PluginInstall +qall

# zsh
#ln -sv ${BASEDIR}/zshrc ~/.zshrc
