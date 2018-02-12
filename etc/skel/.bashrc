# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=9001
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#medavox's prompt, for colour and non-colour terminals
if [ "$color_prompt" = yes ]; then
    PS1='\A \D{%d %b} \[\033[01;35m\]\w\[\033[00m\] \$> '
else
    PS1='\A \D{%d %b} \w \$> '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#enable tab completion during sudo
complete -cf sudo

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias l='ls -hAo'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
alias diff='diff --color=auto'
alias grep='grep --color=auto'

#remove pager from git branch and git tag, as it's annoying.
#equivalent to alias 'git branch'='git --nopager branch'
#but alias doesn't support multiword alias names.
#also does for git tag
#the feature i'm undoing here was introduced in git 2.16.0
git() {
    if [[ $@ == "branch" ]]; then
        command git --no-pager branch
	elif [[ $@ == "tag" ]]; then
		command git --no-pager tag
    else
        command git "$@"
    fi
}

alias ziptX="ssh -XC -c blowfish-cbc"
alias 7z7z="7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on"
alias mount=mount | column -t
alias gpom="git push origin master"
alias gs="git status"
alias gd="git diff"
alias gcam="git commit -am "
alias sz='du -ahd 1 | sort -h'
alias countfiles='find . -type f | wc -l'
#alias caja='caja --no-desktop'
alias pv='pv -tra'
function search(){
	cd /
	find -iname $1 2>/dev/null
	cd $OLDPWD
}
export PATH=$PATH:$HOME/.cabal/bin
#export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
