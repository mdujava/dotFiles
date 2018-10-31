#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USRDIR="$(cd && pwd)"

function install_git {
    if [ ! -f ${USRDIR} ]; then
        user_record=$(getent passwd $USER)
        user_gecos_field=$(echo "$user_record" | cut -d ':' -f 5)
        user_full_name=$(echo "$user_gecos_field" | cut -d ',' -f 1)
        #$ echo $user_full_name

        read -p "enter your name(or leave blank for $user_full_name):" name
        if [ ! $name ]; then
            name=$user_full_name
        fi

        if [ ! $email ]; then
            read -p "enter your email:" email
        fi

        touch ${BASEDIR}/git/.gitconfig
        cat ${BASEDIR}/git/.gitconfig-head >  ${BASEDIR}/git/.gitconfig
        echo '    name =' $name          >> ${BASEDIR}/git/.gitconfig
        echo '    email =' $email          >> ${BASEDIR}/git/.gitconfig
        cat ${BASEDIR}/git/.gitconfig-tail >> ${BASEDIR}/git/.gitconfig
    fi
}

function install {
    if [ ! -z "$4" ]; then
        $($4)
    fi
    if [ ! -f "$1" ]; then
        ln -sv $2 $1
        echo -e "\e[32m$3\e[0m has been installed."
    else
        echo -e "\e[31m$3\e[0m is already installed"
    fi
}

# bash #########################
install ${USRDIR}/.bashrc ${BASEDIR}/bash/.bashrc bashrc

install ${USRDIR}/.bash_aliases ${BASEDIR}/bash/.bash_aliases bash_aliases

# tmux #########################
install ${USRDIR}/.tmux.conf ${BASEDIR}/tmux/.tmux.conf tmux.conf

# vim #########################
install ${USRDIR}/.vimrc ${BASEDIR}/vim/.vimrc vimrc
install ${USRDIR}/.vim/all.vim ${BASEDIR}/vim/all.vim all.vim
install ${USRDIR}/.vim/keymap.vim ${BASEDIR}/vim/keymap.vim keymap.vim

echo "Installing bundle"
if [ ! -d "${USERDIR}/.vim/bundle" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Bundle is alredy installed"
fi

echo "Updating vim plugins"
vim +PluginInstall +qall

# git #########################
install ${USRDIR}/.gitconfig ${BASEDIR}/git/.gitconfig gitconfig
install_git

# xinit #########################
install ${USRDIR}/.xinitrc ${BASEDIR}/X11/.xinitrc "xinitrc"

# help #########################
install ${USRDIR}/.help ${BASEDIR}/help/help "help"
