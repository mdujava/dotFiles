# protect cp, mv, rm command with confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bc='bc -l'

alias ..='cd ..'
alias cd..='cd ..'
alias c='clear'

alias path='echo -e ${PATH//:/\\n}'
alias mount='mount |column -t'

if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi

#git 
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gus='git push'
alias gul='git pull'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '
