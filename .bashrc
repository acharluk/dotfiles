#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'


## Custom ACharluk ##

alias ff='for f in nocaseglob nullglob ~/Music/* ; do ffplay -nodisp -autoexit "$f"; done'

alias lumos="ls -lahF" #spell
alias accio="grep --color=auto" #spell
alias avadakedabra="kill -9" #spell

#region Shortcuts

# Basic shortcuts
alias s='sudo'
alias c='clear'
alias l='ls -aF'
alias ll='lumos'
alias la='l | accio'
alias lla='ll | accio'
alias ..='cd ..'
alias .h='cd ~'
alias .d='cd ~/delete'
alias .w='cd ~/downloads'

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

# Shortcuts for pacman/yaourt
alias y='yaourt'
alias yi='sudo pacman -S'
alias yr='sudo pacman -Rs'
alias yu='sudo pacman -Su'
alias yyu='sudo pacman -Syu'
alias yrd='s pacman -Rs $(pacman -Qtdq)'

#endregion


#region $PS1

# get current branch in git repo
function echo_git_and_exitstatus() {
    ret_val=$?
    output=""
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]; then
		STAT=`parse_git_dirty`
		output="${output}[${BRANCH}${STAT}] "
	fi

    if [ $ret_val -ne 0 ]; then
        output="${output}\e[35m<${ret_val}>\e[m "
    fi
    echo -e "$output"
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[34m\]\u\[\e[m\]@\h \[\e[33m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[33m\]]\[\e[m\] \[\e[36m\]\`echo_git_and_exitstatus\`\n\[\e[37m\]\\$\[\e[m\] "

#endregion

## Your custom config ##
