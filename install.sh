#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USRDIR="$(cd && pwd)"

. profile/profilerc

function install_cle {
    pushd /tmp
    wget http://git.io/clerc
    . clerc
    cle deploy
    popd
}

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
        echo '    name =' $name            >> ${BASEDIR}/git/.gitconfig
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

# profile #########################
install ${USRDIR}/.profilerc ${BASEDIR}/profile/profilerc profilerc

# bash #########################
install ${USRDIR}/.bashrc ${BASEDIR}/bash/.bashrc bashrc

install ${USRDIR}/.bash_aliases ${BASEDIR}/bash/.bash_aliases bash_aliases

install_cle

# tmux #########################
install ${USRDIR}/.tmux.conf ${BASEDIR}/tmux/.tmux.conf tmux.conf

# vim #########################
mkdir $XDG_DATA_HOME/vim/undo/
mkdir $XDG_DATA_HOME/vim/swap/
mkdir $XDG_DATA_HOME/vim/backup/
install ${USRDIR}/.config/vim/vimrc ${BASEDIR}/vim/.vimrc vimrc
mkdir ${XDG_DATA_HOME}/vim/
install ${XDG_CONFIG_HOME}/vim/all.vim ${BASEDIR}/vim/all.vim all.vim
install ${XDG_CONFIG_HOME}/vim/keymap.vim ${BASEDIR}/vim/keymap.vim keymap.vim

echo "Installing bundle"
if [ ! -d "${USERDIR}/.vim/bundle" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ${XDG_DATA_HOME}/vim/bundle/Vundle.vim
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
install ${USRDIR}/.Xdefaults ${BASEDIR}/X11/Xdefaults "xdefaults"

# help #########################
install ${USRDIR}/.help ${BASEDIR}/help/help "help"

# i3 #########################
install ${XDG_CONFIG_HOME}/i3/config ${BASEDIR}/i3/config "i3/config"
install ${XDG_CONFIG_HOME}/i3/get_workspace_options.py ${BASEDIR}/i3/get_workspace_options.py "i3/get_workspace_options.py"
install ${XDG_CONFIG_HOME}/i3/go_to_workspace.py ${BASEDIR}/i3/go_to_workspace.py "i3/go_to_workspace.py"
install ${XDG_CONFIG_HOME}/i3/move_to_workspace.py ${BASEDIR}/i3/move_to_workspace.py "i3/move_to_workspace.py"
install ${XDG_CONFIG_HOME}/i3/i3status ${BASEDIR}/i3/i3status "i3/i3status"
