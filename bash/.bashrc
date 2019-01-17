# ~/.bashrc: executed by bash(1) for non-login shells.
# author - Xaheen Azad
# Link: https://github.com/XaheenA/dotfiles/

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# disable ctrl-s and ctrl-q --> screen pausing stuff
stty -ixon

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth	# Ignore commands that start with spaces and duplicates.
# Don't add certain commands to the history file.
HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# change additional shell optional behavior.
shopt -s histappend		# append to the history file, don't overwrite it
shopt -s checkwinsize	# check the window size after each command and update size
shopt -s autocd			# Automatically prepend `cd` to directory names.
shopt -s cdspell		# Autocorrect typos in path names when using the `cd` command.
shopt -s extglob		# Use extended pattern matching features.
shopt -s dotglob		# Include filenames beginning with a "." in the filename expansion.
shopt -s nocaseglob		# Match filenames in a case-insensitive fashion when performing filename expansion.

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
    # xterm-color|*-256color) color_prompt=yes;;
# esac
export TERM=xterm-256color
# export TERM="screen-256color"
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
##################### Color stuffs ##################################
#
# orange=$(tput setaf 166);
# yellow=$(tput setaf 228);
# green=$(tput setaf 71);
# blueish=$(tput setaf 32);
# white=$(tput setaf 15);
# red=$(tput setaf 88);
# bold=$(tput bold);
# reset=$(tput sgr0);
# if [ "$color_prompt" = yes ]; then
#     #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#      PS1="\[${bold}\]\n";
#      PS1+="\[${green}\]\u";
#      PS1+="\[${red}\] @ ";
#      PS1+="\[${blueish}\]\W >>";
#      PS1+="\[${yellow}\]\$ \[${reset}\]";
#      export PS1
#
#
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# #################### Alias compilation #################################
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ############################## Extra #################################
#if [ -f ~/.bash_extra ]; then
#    . ~/.bash_extra
#fi
# #########################################################################
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

################# EXPORTS #####################
export EDITOR=nvim 				# making neovim systemwide default editor
export MANPAGER="nvim -c 'set ft=man' -"	# view manpages in neovim
export PATH=/usr/local/cuda-9.0/bin${PATH:+:$PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

######## Aktivate VI mode with <Esc> in shell ##########
# set -o vi

# Settings for FZF : read - https://github.com/junegunn/fzf 
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

####################################################################################
# # powerline setup
# # https://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/    (use pip3)
# export TERM=”screen-256color”
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /home/xollad/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh


#" start byobu by default"
# byobu

# Change the prompt when you open a shell from inside ranger
# [ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '

# ROS
# source /opt/ros/melodic/setup.bash

#####################################################################################
###################### base16 colors ################################################
## https://github.com/chriskempson/base16-shell
# type base16_   and double tab
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

_today=$(($(date +%s%N)/1000000))
if [ $((_today%2)) -eq 0 ]
then
    base16_railscasts
    echo "Theme > railscasts" | lolcat
elif [ $((_today%7)) -eq 0 ]
then
    base16_spacemacs
    echo "Theme > spacemacs" | lolcat
elif [ $((_today%9)) -eq 0 ]
then
    base16_atelier-dune
    echo "Theme > atelier-dune" | lolcat
elif [ $((_today%11)) -eq 0 ]
then
    base16_atelier-forest
    echo "Theme > atelier-forest" | lolcat
elif [ $((_today%15)) -eq 0 ]
then
    base16_atelier-seaside
    echo "Theme > atelier-seaside" | lolcat
else
    base16_monokai
    echo "Theme > MONOKAI" | lolcat
fi

# start neofetch
neofetch
fortune -s | cowthink | lolcat
echo " "


# added by Anaconda3 installer
. /home/xollad/anaconda3/etc/profile.d/conda.sh
