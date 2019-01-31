#!/bin/bash
######### all aliases ################
alias srcbash="source ~/.bashrc"
alias ls='ls -CF --color=auto --group-directories-first'
alias ll='ls -AlFXh --color=auto --group-directories-first'
alias la='ls -A --color=auto'
alias sl='ls --color=auto --group-directories-first'
alias l='ls -1 --color=auto'
alias clear='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo' # https://github.com/holman/spark

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias calc='bc -l'
alias bc='bc -l'
alias chmox='chmod +x $1'
alias mkdir='mkdir -pv' ### create parent directory withoout error if exists and create directory with messege
alias webcam='ffplay -f video4linux2 -i /dev/video0 -video_size 320x240 -fflags nobuffer'
alias arecord='arecord -f cd'  # record cd quality audio by default
alias diff='colordiff'	# install colordiff :)
alias mount='mount |column -t'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias e='nvim'
alias vi='nvim'
alias edit='nvim'
alias vimplug="vim +PlugInstall +PlugUpdate +PlugUpgrade +qa && vim"
alias nvimplug="nvim +PlugInstall +PlugUpdate +PlugUpgrade +qa && nvim"
alias mutt='neomutt'
alias mail='neomutt' # install neomutt first ;)
alias cradio='curseradio'
alias cr='curseradio'
alias py='bpython'
alias rss="newsboat"
alias viber='/opt/viber/Viber'
alias eclip='~/eclipse/java-photon/eclipse/eclipse'
alias cypress='cd ~/Dropbox/Documents/cypress-works/ && node_modules/.bin/cypress open'
alias tma='tmux attach -t myworkbench'
alias tmn='tmux new    -s myworkbench'
alias starwars='telnet towel.blinkenlights.nl' # to exit : <c-+> quit
alias pacman='pacman4console'
alias 2048='cd ~ && ./2048'
alias pie-piu='cd ~/dotfiles/others && ./pie-piu'
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -Iv --preserve-root'
alias findg="find . | grep "  # Search files in the current folder
alias diskspace="du -S -h | sort -n -r |more" # Alias's to show disk space and space used in a folder
alias dusort='du -a -d 1 | sort -hr'
alias dfsort='pydf -h | sort -r -n'
alias feh="feh -Tdefault --scale-down --auto-zoom"
alias lock="sh $HOME/dotfiles/others/i3_lock.sh"
alias extract="~/dotfiles/others/extract"
alias bm="cd $HOME/dotfiles/others/bashmount/ && ./bashmount.sh && clear && cd "
alias td="cd /home/xollad/Dropbox/linux_stuff/ && nvim todos.txt"
alias bashmount="cd $HOME/dotfiles/others/bashmount/ && ./bashmount.sh && clear && cd"
alias restartNetwork="cd $HOME/dotfiles/others/ && ./network_restart.sh"
alias networkRestart="cd $HOME/dotfiles/others/ && ./network_restart.sh"

# livescore-cli
alias bpl='livescore -t bpl'
alias laliga='livescore -t laliga'
alias bundesliga='livescore -t bundesliga'
alias ligue1='livescore -t ligue1'
alias seriea='livescore -t seriea'

#### confirmation ####
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'
alias root='sudo -i'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # search process easily e.g "psg cmus"
alias wget="wget -c"   #continue the download in case of problems
alias dl='wget -r -e robots=off -nc -np'
alias myip="curl http://ipecho.net/plain; echo"  # your public IP address
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias nolock='cd /home/xollad/dotfiles/i3/scripts/ && ./no-screen-lock.sh'
alias study='cd ~/Dropbox/TUTORIALS/must-know-topics/ && ranger'
############ Movements ####################
alias doc='cd ~/Dropbox/Documents && ls -la'
alias temp='cd ~/Dropbox/temp && ls -la'
alias testdir='cd ~/Dropbox/Documents/test && ls -la'
alias dot='cd ~/dotfiles && git status'
alias doto='cd ~/dotfiles/others && git status'
alias down='cd ~/Downloads && ls -la'
alias conf='cd ~/.config && ls -la'
alias unixc='cd ~/Dropbox/Documents/UNIXcoding && ls -la'
alias riot='cd ~/Documents/RIOT/Tutorials/ && ls -la'
alias cd..="cd .."
alias ..="cd .. && pwd; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo"
alias ...="cd ../../ && pwd; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo" # go two directories back


############ Config Files ####################
alias nvimrc='cd ~/.config/nvim/config && nvim ../init.vim'
alias vimrc='cd ~/.vim/config && nvim ~/.vimrc'
alias tmuxrc='cd ~/.tmux && nvim ~/.tmux.conf'
alias quterc='cd ~/.config/qutebrowser && nvim config.py'
alias muttrc='nvim ~/.muttrc'
alias rangerrc='cd ~/.config/ranger && nvim ~/.config/ranger/rc.conf'
alias zathurarc='cd ~/.config/zathura && nvim zathurarc'
alias i3rc='cd ~/.config/i3 && nvim config'
alias conkywttr='cd ~/.config/conky && nvim .conkyrc_wttr'
alias conkyrc='nvim ~/.conkyrc'
alias unicodes='nvim ~/dotfiles/i3/scripts/unicode_collection.txt'
################ Tests ######################
alias say=spd-say
# Make 'less' more.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


## runing commands as sudo ##
if [ $UID -ne 0 ]; then
  alias reboot='sudo reboot'
  alias restart='sudo restart'
  alias shutdown='sudo shutdown -h now'
  alias ghum='sudo shutdown -h now'
  alias update='sudo apt update'
  alias updatesystem='sudo ~/dotfiles/others/updatesystem.sh'
  alias cleansystem='sudo ~/dotfiles/others/cleansystem.sh'
  alias emptythrash='sudo chown -R xollad ~/.local/share/Trash && rm -rfv ~/.local/share/Trash/* && sudo rm -rf ~/.cache/thumbnails/*'
  alias dnscache='sudo ~/dotfiles/others/dnscache.sh'
fi


## type path to see path variable in a list
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}


# Automatically cd into a newly-created folder after it was created.
function mkd {
	command mkdir $1 && cd $1
}

# use tailc to tail with ccze
function tailc {
    tail $@ | ccze -A
}

# nice weather in CLI
w() {
    tmpfile=$(mktemp)
    curl -s wttr.in/$1 > $tmpfile
    cat $tmpfile | sed -e 's:226m:202m:g'
    rm $tmpfile
}
alias weather='w'
alias wtr='w'
alias wttr='curl wttr.in/hamburg'
alias wd='curl wttr.in/dhaka'
alias wttrd='curl wttr.in/dhaka'

# show binary clock
_binclock(){
    watch -n 1 'echo "obase=2;`date +%s`" | bc'
}
alias binclk='_binclock'
alias clk='tty-clock -s -S -b -B -c'

# get image from website
_get_image(){
    wget -r -l1 --no-parent -nH -nd -P/home/xollad/Downloads/images -A".gif,.jpg" $1
}

# download youtuve video
_get_video(){
    name=$1
    url=$2
  if [$name==""]; then
    echo "usage: get_video FileName.ext FullURL"
  else
    youtube-dl -c -o "$name" -f 22 $url
  fi
}
alias get_image="_get_image"
alias get_video='_get_video'
alias youtube2mp4='_get_video'
alias youtube2mp3='youtube-dl -t -c -v --extract-audio --restrict-filenames --audio-format mp3'
alias get_audio='youtube-dl -t -c -v --extract-audio --restrict-filenames --audio-format mp3'
alias youtube2playlist='youtube-dl --restrict-filenames -i -f mp4 --yes-playlist'
alias get_playlist='youtube-dl --restrict-filenames -i -f mp4 --yes-playlist'
alias ripaudio='mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile'

# This is a bash function for .bashrc to automatically change the directory to
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
    clear
}
# This binds Ctrl-O to ranger-cd: so, open ranger with ctrl-o
bind '"\C-o":"ranger-cd\C-m"'
alias r='ranger-cd'
alias RR='sudo ranger'
alias rr='nnn'

#==================================================================================
# delete last n command history
histdel(){
  for h in $(seq $1 $2 | tac); do
    history -d $h
  done
  history -d $(history | tail -1 | awk '{print $1}')
}

historydelete(){
    # Get the current history number
    n=$(history | tail -1 | awk '{print $1}')

    # Call histdel with the appropriate range
    histdel $(( $n - $1 )) $(( $n - 1 ))
}

#========================================================================
# qutebrowser
alias cleanqutebrowser='rm -rf ~/.local/share/qutebrowser/webengine/*  && rm -rf ~/.local/share/qutebrowser/history.sqlite && rm -rf ~/.local/share/qutebrowser/sessions/* && rm -rf ~/.cache/qutebrowser/*'

# type 'readme' on any git directory
function readme() {
    for readme in {readme,README}.{md,MD,markdown,txt,TXT,mkd}; do
        if [[ -f "$readme" ]]; then
            cat $readme
        fi
    done
}
#========================================================================
function datelog(){
    date=`date '+%d-%m-%y'`
    minute=$(cat ~/Dropbox/linux_stuff/laptop_time/log/"$date")
    hour=$(($minute/60))
    min=$(($minute%60))
    echo -e "Laptop used today for : \n\t\t$hour hours and $min minutes" | lolcat -F 0.2
}
alias datelogplot='python3 /home/xollad/dotfiles/others/datelog_month.py'
alias datelogplot_all='python3 /home/xollad/dotfiles/others/datelog_all.py'
#========================================================================
move_to_trash () {
    mv -v "$@" ~/.local/share/Trash
}
alias rmv='move_to_trash'
#========================================================================
# function ghdl_compile_and_run () {
#     rm -v work* *.vcd
#     tb='_tb'
#
#     filename_main="$1"
#     filename_tb="$1$tb"
#
#     ghdl -s $filename_main.vhdl
#     ghdl -s $filename_tb.vhdl
#
#     ghdl -a $filename_main.vhdl
#     ghdl -a $filename_tb.vhdl
#
#     ghdl --elab-run $filename_tb
#     ghdl -r $filename_tb --vcd=$filename_main.vcd
#
#     gtkwave $filename_main.vcd
# }
# alias ghdl_all='ghdl_compile_and_run'
