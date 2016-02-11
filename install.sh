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

if [ ! $name ]
then
    user_record=$(getent passwd $USER)
    user_gecos_field=$(echo "$user_record" | cut -d ':' -f 5)
    user_full_name=$(echo "$user_gecos_field" | cut -d ',' -f 1)
    #$ echo $user_full_name

    read -p "enter your name(or leave blank for $user_full_name):" name
    if [ ! $name ]
    then
        name=$user_full_name
    fi
fi

if [ ! $email ]
then
read -p "enter your email:" email
fi

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
