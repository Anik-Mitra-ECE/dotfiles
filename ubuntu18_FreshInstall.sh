#!/bin/sh
# Ubuntu 18.04 Post install script
# run --> sudo ./ubuntu18_FreshInstall.sh > log.txt 2> err.txt
# or ---> sudo ./ubuntu18_FreshInstall.sh | tee log.txt
# install at your own risk


clear
echo "#################################################################"
echo "############## After Fresh installation Script ##################"
echo "############### Updated for Ubuntu 18.04 #######################"

if [[ $EUID -ne 0 ]]; then
 echo ">>>>>>>>>>>>>> This script must be run as root <<<<<<<<<<<<<<<"
 exit 1
fi

sleep 1
clear
echo "#################################################################"
echo "################ Updating and Upgrading #########################"
echo "#################################################################"
sudo apt -y  update
sudo apt -y  upgrade
sudo apt -y  dist-upgrade

echo "#################################################################"
echo "################ add repositories ###############################"
echo "#################################################################"
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/java	       		    # repo for ORacle JDK
sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo add-apt-repository -y ppa:apandada1/up-clock
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:neovim-ppa/stable         	   # neovim
sudo add-apt-repository -y ppa:peek-developers/stable
sudo add-apt-repository -y ppa:bluetooth/bluez
sudo add-apt-repository -y ppa:alexlarsson/flatpak
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

# enable 32 bit architecture on 64 bit system
sudo dpkg --add-architecture i386 

# protection against spectre and meltdown
sudo apt install -y microcode.ctl intel-microcode

# basic update
sudo apt -y  update
sudo apt -y  upgrade
echo "========================================================================================"
echo "#################################################################"
echo "############## Downloading all packages #########################"
echo "#################################################################"
sleep 3
sudo apt install -y git curl wget colordiff meld lolcat spark
sudo apt install -y fonts-font-awesome
sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y vlc browser-plugin-vlc mplayer 
sudo apt install -y crm114 qutebrowser
sudo apt install -y mtp-tools mtpfs go-mtpfs libmtp     # for connecting mobile
sudo apt install -y gimp gimp-data gimp-plugin-registry gimp-data-extras 
sudo apt install -y kolourpaint          # photo editor
sudo apt install -y gufw                 # firewall --> https://help.ubuntu.com/community/Gufw
sudo apt install -y dconf-tools                         # for Dock customization
sudo apt install -y rar unrar zip unzip p7zip-full p7zip-rar arj zoo cabextract uudeview mpack unace sharutils  # extracting tools
sudo apt install -y laptop-mode-tools
sudo apt install -y calcurse cmus   	      # Commandline calender and Music player
sudo apt install -y w3m w3m-img apache2    # command line web browser
sudo apt install -y caca-utils highlight transmission-cli atool poppler-utils mediainfo odt2txt ranger nnn # commandline file manager
sudo apt install -y tree htop tmux net-tools
sudo apt install -y mpv newsboat            # gif viewer and rss reader
     pip install rtv                        # reddit cli
sudo apt install -y rxvt-unicode
sudo apt install -y peek                    # record gif
sudo apt install -y gthumb                  # like picasa
sudo apt install -y shutter                 # taking screenshot
sudo apt install -y simplescreenrecorder    # small handy screen recorder
sudo apt install -y urlview feh	            # urlviewer, image, viewer
sudo apt install -y zathura okular          # PDF viewer
sudo apt install -y openssh-server openssh-client vnc4server	  # remote connection
# sudo apt install -y browser-plugin-freshplayer-pepperflash	  # dont install it if you dont need it -- not secure
ranger --copy-config=all                                       # for ranger
# gksu is removed from Ubuntu 18
# use the format --> gedit admin:///etc/default/apport

# install editors, compilors
sudo apt -y  update
sudo apt install -y aspell-en aspell-de
sudo apt install -y atom
sudo apt install -y python python-pip python3 python3-pip python-dev python3-dev python-tk python3-tk python3-venv
sudo apt install -y vim vim-gnome neovim
     pip  install websocket-client sexpdata                                            # ensime server for scala
     pip3 install websocket-client sexpdata
     pip3 install pep8 flake8 yapf jedi python-autopep8 pyflakes isort neovim unicode  # code formatters python3
     pip  install pep8 flake8 yapf jedi python-autopep8 pyflakes isort neovim unicode  # code formatters python2
     pip3 install python-bidi chardet                                                  # for ranger
     pip3 install --upgrade neovim
     pip  install --upgrade autopep8
     pip3 install --upgrade autopep8

sudo apt install -y gcc g++ build-essential cmake                    			               # C and C++ compiler
sudo apt install -y clang clang-format
sudo apt install -y exuberant-ctags ack-grep ncurses-term par     				                 # code formatters c family
sudo apt install -y groff groff-base
sudo apt install -y texlive-base texlive texlive-latex-recommended texlive-science texlive-latex-extra latexmk lacheck chktex texlive-xetex nbibtex libsynctex-dev perl-tk # Latex
sudo apt install -y texmaker focuswriter
sudo apt install -y pandoc pandoc-citeproc dvipng
sudo apt install -y sudo apt -y install pdf-presenter-console   # [https://github.com/pdfpc/pdfpc]
sudo apt install -y xdotool nodejs npm                          # for vim markdown live preview

## node installs
sudo npm install -g eslint
sudo npm install -g eslint-config-airbnb babel-eslint eslint-plugin-react
sudo npm install -g instant-markdown-d
sudo npm install -g neovim
sudo npm install -g terminalizer
sudo npm install -g cli-typer
sudo npm install -g npm-check

## MySQL and mongodb
# sudo apt -y install mysql-server mysql-workbench
# sudo apt -y install mongodb mycli
# account setup ###
# sudo mysql -u root
# use mysql
# CREATE USER 'username'@'localhost' IDENTIFIED BY 'yourpassword';
# quit
## install driver for Fritz wlan stick --> DOES NOT WORK for AC 430 MODEL!!!! 

### other apps
sudo apt -y  update
sudo apt install -y taskwarrior recoll     # task manager and file finder/search like everything
sudo apt install -y cowsay cmatrix neofetch up-clock conky-all at leave 
sudo apt install -y howdoi
sudo apt install -y most tty-clock pydf pacman4console
sudo apt install -y fortune-mod fortunes-de fortunes-off
sudo apt install -y keepassx              # password manager
sudo apt install -y chrome-gnome-shell	   # Browser extension for Google Chrome/Chromium, Firefox
sudo apt install -y python-gpg nautilus-dropbox
sudo apt install -y neomutt powerline
sudo apt install -y xautolock i3lock i3lock-fancy acpi
sudo apt install -y aptitude moreutils

# install youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/bin/youtube-dl
sudo chmod a+rx /usr/bin/youtube-dl
youtbue-dl -U

# install football livescore-cli --> https://github.com/codeezer/livescore-cli
cd ~/Downloads
git clone https://github.com/codeezer/livescore-cli.git
cd livescore-cli
./setup
cd ~
#### Cool retro term and themes
sudo add-apt-repository ppa:vantuz/cool-retro-term
sudo apt install cool-retro-term -y

### For wine
# https://linuxconfig.org/install-wine-on-ubuntu-18-04-bionic-beaver-linux

# install dunst
sudo apt install -y libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk2.0-dev libxdg-basedir-dev
cd ~/Downloads
git clone https://github.com/dunst-project/dunst.git
cd dunst
make -j5
sudo make install

echo "############## removing unused Folders #######################"
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/examples.desktop
echo  "==================================================================================="
echo "############## remove default apps #######################"
sudo apt remove  -y gnome-mahjongg gnome-mines gnome-sudoku simple-scan rhythmbox
sudo apt remove  -y zeitgeist zeitgeist-core zeitgeist-datahub
sudo apt remove  -y account-plugin-aim account-plugin-facebook account-plugin-flickr account-plugin-jabber
sudo apt remove  -y account-plugin-salut account-plugin-twitter account-plugin-windows-live account-plugin-yahoo
sudo apt remove  -y aisleriot brltty deja-dup deja-dup-backend-gvfs duplicity example-content
sudo apt remove  -y gnome-mahjongg gnome-mines gnome-orca gnome-sudoku gnomine
sudo apt remove  -y rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils mcp-account-manager-uoa python3-uno
sudo apt remove  -y totem totem-common totem-plugins empathy empathy-common evolution-data-server-online-accounts
sudo apt remove  -y evince  # default pdf viewer
# if you want to remove LibreOffice, Thunderbird and total Unity
# sudo apt remove -y libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-presentation-minimizer libreoffice-style-galaxy libreoffice-style-human libreoffice-writer
# sudo apt remove -y thunderbird thunderbird-gnome-support
# sudo apt remove -y unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero

sudo apt purge -y ubuntu-web-launchers
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json
sudo dpkg --divert /usr/share/applications/ubuntu-amazon-default.desktop.diverted --local --rename /usr/share/applications/ubuntu-amazon-default.desktop
sudo apt -y  update

echo "#################################################################"
echo "############## Update System Settings ###########################"
echo "#################################################################"
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'		     # click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'previews' # shift click to preview
gsettings set com.ubuntu.update-notifier regular-auto-launch-interval 0
gsettings set org.gnome.nautilus.preferences enable-interactive-search false    	# recursive search in nautilus
gsettings set com.canonical.indicator.session show-real-name-on-panel true      	# show username on panel
gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state on    # Turn on NumLock on login
gsettings set org.gnome.SessionManager logout-prompt false                       # eliminate the default 60 second delay when logging out
gsettings set org.gnome.settings-daemon.peripherals.mouse middle-button-enabled true

echo "============================================================================="
echo "============================================================================="
# base16 color
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

##### # these needs click # ########
# fuzzy file finder for bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt install -y ubuntu-restricted-extras
sudo apt install -y ubuntu-restricted-addons libavcodec-extra
sudo apt install -y default-jre oracle-java8-installer oracle-java8-set-default maven icedtea-plugin  #JRE and JDK
sudo apt install -y bleachbit
sudo apt install -y gnome-tweak-tool nvidia-common

## language tool for vim --> Huge file -> put it inside nvim folder


#Improve battery life and reduce overheating with TLP
sudo apt install -y  tlp tlp-rdw
sudo tlp start
# change the default apps in /var/lib/dpkg/alternatives
# and settings > details > default apps
sudo update-alternatives --config x-www-browser
sudo update-alternatives --config editor
sudo update-alternatives --config vi
sudo update-alternatives --config vimdiff
# media libs
sudo apt install -y  ffmpeg id3tool lame
sudo apt install -y  pulseaudio pavucontrol  # open volume-control
sudo apt install -y  gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav
sudo apt install -y  libxine2-ffmpeg libmad0 mpg321 libavcodec-extra v4l-utils

echo "============================================================================"
echo "SNAP INSTALLS"
sudo apt install -y snapd
sudo snap install slack --classic
sudo snap install skype --classic 
sudo snap install cheat 
sudo snap install caprine 
# sudo snap install notepad-plus-plus shortcut wire
echo "============================================================================"

echo "============================================================================"
echo "flatpack INSTALLS"
echo "============================================================================"
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install -y flatpak
sudo flatpak install -y flathub org.octave.Octave
# sudo flatpak install -y flathub com.viber.Viber
# sudo flatpac install -y flathub org.blender.Blender


echo "============================================================================"

echo "##################################################################"
echo "################## Finally Cleaning ##############################"
echo "##################################################################"
sudo rm -rf ~/.cache/thumbnails/*   # removing thumbnails
sudo apt clean                      # clean out the cache in its entirety
sudo apt -y autoremove              # removes unused libs and packages and old kernals
echo "-----"
echo "!!!psensor - https://itsfoss.com/check-laptop-cpu-temperature-ubuntu/ !!!"
echo "-----"
echo "=============================================================================="
echo "=============================================================================="
echo " "
sleep 3
echo -e "\n$(tput setaf 7)"
echo -e "\n$(tput bold)"
echo "========================================================"
echo "			===================="
echo " 			TIME FOR A REBOOT!  "
echo "			===================="
echo "========================================================"

echo -ne "REBOOTING in 3 secs"
sleep 3
sudo reboot
