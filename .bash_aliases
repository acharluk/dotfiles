alias ff='for f in nocaseglob nullglob ~/Music/* ; do ffplay -nodisp -autoexit "$f"; done'

# Spells
alias lumos="ls -lahF"
alias accio="grep --color=auto"
alias avadakedabra="kill -9"

# Basic shortcuts
alias s='sudo'
alias c='clear'
alias l='ls -aF'
alias ll='lumos'
alias la='l | accio'
alias lla='ll | accio'

# Useful directories
alias ..='cd ..'
alias .h='cd ~'
alias .t='cd ~/testing'
alias .w='cd ~/downloads'
alias .r='cd ~/repos'
alias .d='cd ~/documents'
alias .m='cd ~/music'
alias .p='cd ~/pictures'
alias .v='cd ~/videos'

alias l..='l ..'
alias l.h='l ~'
alias l.t='l ~/testing'
alias l.w='l ~/downloads'
alias l.r='l ~/repos'
alias l.d='l ~/documents'
alias l.m='l ~/music'
alias l.p='l ~/pictures'
alias l.v='l ~/videos'

alias ll..='ll ..'
alias ll.h='ll ~'
alias ll.t='ll ~/testing'
alias ll.w='ll ~/downloads'
alias ll.r='ll ~/repos'
alias ll.d='ll ~/documents'
alias ll.m='ll ~/music'
alias ll.p='ll ~/pictures'
alias ll.v='ll ~/videos'

# Shortcut for editing config files in vim
alias v='$EDITOR'
alias vbrc='$EDITOR $conf_brc'
alias vbp='$EDITOR $conf_bp'
alias vvrc='$EDITOR $conf_vrc'
alias vi3c='$EDITOR $conf_i3c'
alias vi3b='$EDITOR $conf_i3b'

# Shortcut for editing config files in vscode
alias vv='$EDITOR2'
alias vvbrc='$EDITOR2 $conf_brc'
alias vvbp='$EDITOR2 $conf_bp'
alias vvvrc='$EDITOR2 $conf_vrc'
alias vvi3c='$EDITOR2 $conf_i3c'
alias vvi3b='$EDITOR2 $conf_i3b'

# Shortcuts for git
alias g='git'
alias gl='git pull'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gp='git push'

# Shortcuts for pacman/yaourt
alias y='yaourt'
alias yi='sudo pacman -S'
alias yr='sudo pacman -Rs'
alias yu='sudo pacman -Su'
alias yyu='sudo pacman -Syu'
alias yrd='s pacman -Rs $(pacman -Qtdq)'