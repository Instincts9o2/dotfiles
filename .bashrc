# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}>>>:\w\$ '
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# related to pywal
# Import colorscheme from 'wal'
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(wal -r &)

# If the command above doesn't work,
# try this alternative.
# setsid wal -r

# for vim in bash

set -o vi

alias cfi='vim ~/.config/i3/config'
alias cfq='vim ~/.config/qutebrowser/config.py'
alias cfp='vim ~/.config/polybar/config'
alias cfc='vim ~/.config/compton/config'
alias cfr='vim ~/.config/ranger/rc.conf'
alias cfx='sudo vim ~/.Xresources'
alias cfb='vim ~/.bashrc'
alias cfv='vim ~/.vimrc'
alias ccr='compton --config ~/.config/compton/config -b'
alias cfn='vim ~/.ncmpcpp/config'
alias cft='vim ~/.tmux.conf'

alias xdb='xrdb ~/.Xresources'
alias nf='clear && neofetch'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias ht='htop'
alias ra='ranger'
alias bandho='sudo poweroff'
alias restart='sudo reboot'
alias sol='cd ~/Solstice'
alias sounds='~/Solstice/bash_scripts/alsa/alsa.sh'
alias tc='sudo vim ~/.tmux.conf'
alias cl='clear'
alias hp='~/Solstice/bash_scripts/alsa/headphones.sh'
alias pg='ping www.google.com'
alias nc='ncmpcpp'
alias tk='tmux kill-session'
alias xmod='xmodmap ~/.Xmodmap'
alias ls='ls -hN --color=auto --group-directories-first'
alias bars="bash ~/.config/polybar/launch.sh"
alias clock="ncmpcpp -s clock"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ll='ls -l'

export BROWSER="qutebrowser"
export BROWSERCLI="w3m"

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\[$(tput setaf 2)\]\[$(tput setaf 4)\]\[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\] [\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]\n  >>>:\$ \[$(tput sgr0)\]"


#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd 
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob 

# mutt background fix
COLORFGBG="default;default"

#-------- Wget (Retrieve Files From The Web) {{{
#------------------------------------------------------
wget-extension() {
if [ $# -lt 2 ]; then
    echo -e "Download all files with specific extension on a webpage"
    echo -e "\nUsage: $0 <file_extension> <url>"
    echo -e "\nExample:\n$0 mp4 http://example.com/files/"
    echo -e "$0 mp3,ogg,wma http://samples.com/files/"
    echo -e "\nGoogle: http://lmgtfy.com/?q=intitle%3Aindex.of+mp3+-html+-htm+-php+-asp+-txt+-pls+madonna"
    return 1
fi

outputdir_name=$(echo "$2" | rev | cut -d\/ -f2 | rev)
mkdir -pv "$outputdir_name"
cd "$outputdir_name" && wget -r -l1 -H -t1 -nd -N -np -A "$1" -erobots=off "$2"
                                  }

                                  # }}}
