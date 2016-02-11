#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
if [ -f "/home/$USER/.bashrc" ]
then
    echo 'file exists'
else
    ln -sv ${BASEDIR}/bash/.bashrc ~/.bashrc
fi
if [ -f "/home/$USER/.bash_aliases" ]
then
    echo "file exists"
else
    ln -sv ${BASEDIR}/bash/.bash_aliases ~/.bash_aliases
fi

# git
touch ${BASEDIR}/git/.gitconfig
cat ${BASEDIR}/git/.gitconfig-head >  ${BASEDIR}/git/.gitconfig
echo '    name =' $name          >> ${BASEDIR}/git/.gitconfig
echo '    email =' $email          >> ${BASEDIR}/git/.gitconfig
cat ${BASEDIR}/git/.gitconfig-tail >> ${BASEDIR}/git/.gitconfig
if [ -f "/home/$USER/.gitconfig" ]
then
    echo "file exists"
else
    ln -sv ${BASEDIR}/git/.gitconfig ~/.gitconfig
fi

# vim
if [ -d "/home/$USER/.vim/bundle" ]
then
    echo "file exists"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
if [ -f "/home/$USER/.vimrc" ]
then
    echo "file exists"
else
    ln -sv ${BASEDIR}/vim/.vimrc ~/.vimrc
fi
vim +PluginInstall +qall

# zsh
#if [ -f "/home/$USER/.zshrc" ]
#then
#    echo "file exists"
#else
#    ln -sv ${BASEDIR}/zshrc ~/.zshrc
#fi
