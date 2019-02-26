#!/bin/sh

# git clone https://github.com/XaheenA/dotfiles.git
cd ~/dotfiles
git pull origin master
cd ~
echo "============================================"
### copy cmus config files to ~/.config/cmus
echo "Copying cmus configs"
mkdir ~/.cmus
cd ~/dotfiles/cmus
cp -var --remove-destination rc bored.theme itunes.theme gruvbox.theme tomorrow.theme screenshot.theme ~/.cmus

echo "============================================"

### git
echo "Copying GIT configs"
cd ~/dotfiles/git
cp -var --remove-destination .gitconfig ~
# add git timeout limit for password cache
git config credential.helper 'cache --timeout=43200'
echo "============================================"

### copy .vimrc to HOME
echo "Copying VIM configs"
echo "TBD"
# cd ~/dotfiles/vim
echo "============================================"

### NEOVIM
echo "Copying NEOVIM configs"
echo "TBD"
#cd ~/dotfiles
#cp -r -v --remove-destination nvim ~/.config/

echo "============================================"

### base16_colors
# echo "Cloning Base16 colors"
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo "============================================"

### mutt
cd ~
mkdir .mutt
cd ~/dotfiles/mutt
# cp -va --remove-destination .muttrc ~
# cp -var --remove-destination ~/dotfiles/mutt/.mutt/. ~/.mutt/

echo "============================================"

### newsboat
cd ~
rm -rf .newsboat/*
cd ~/dotfiles/.newsboat
cp -va --remove-destination config ~/.newsboat/
cp -va --remove-destination urls ~/.newsboat/
echo "============================================"

### urlview
cd ~/dotfiles/.urlview
cp -va --remove-destination config ~
cp -va --remove-destination webview.sh ~/.config
echo "============================================"

### ranger
cd ~/dotfiles/ranger/ranger
cp -va --remove-destination rc.conf ~/.config/ranger
cp -va --remove-destination rifle.conf ~/.config/ranger
cp -va --remove-destination scope.sh ~/.config/ranger
echo "============================================"

### Conky
echo "copying Conky config"
cd ~/.config
mkdir conky
cd ~/dotfiles/conky
cp -va --remove-destination .conkyrc ~
cp -va --remove-destination * ~/.config/conky/
echo "============================================"

### neofetch
cd ~/dotfiles/others/neofetch
cp -va --remove-destination config.conf ~/.config/neofetch
echo "============================================"

### copy bash files
cd ~/dotfiles/bash
cp  -va --remove-destination .bashrc ~
cp  -va --remove-destination .bash_profile ~
cp  -va --remove-destination .bash_aliases ~
echo "============================================"
echo "--sourcing .bashrc"
cd ~
exec bash
echo "============================================"
echo "============================================"

# for devicons
#mkdir -p ~/.fonts && cd ~/.fonts
#curl -fLo "Hermit_devicons.otf" https://github.com/ryanoasis/nerd-fonts/blob/0.9.0/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf
#mkdir -p ~/.local/share/fonts
#cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf



# make useful directories
cd ~/Downloads
mkdir sources     # for repos
mkdir attachments # for mutt
