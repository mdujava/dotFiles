#git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gus='git push'
alias gul='git pull'
alias gd='git diff'
alias go='git checkout'

alias yt="youtube-dl --add-metadata -ic"
alias yta="youtube-dl --add-metadata -xic"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ip='ip -c'
alias update='yaourt -Syyu'
alias updateaur='yaourt -Syyu --aur'
alias fwd_ssh='eval "$(ssh-agent -s)"; ssh-add -t 300 ~/.ssh/id_rsa'
alias mailkoc='fwd_ssh; ssh kocurkovo -t mutt'

alias mypass='PASSWORD_STORE_DIR=~/personal/.password-store pass'
