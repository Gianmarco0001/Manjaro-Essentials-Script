#!/bin/bash
# This script is created by MrCodeBlocks.
# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'
cat << "EOF"

___  ___       _____           _       ______ _            _        
|  \/  |      /  __ \         | |      | ___ \ |          | |       
| .  . |_ __  | /  \/ ___   __| | ___  | |_/ / | ___   ___| | _____ 
| |\/| | '__| | |    / _ \ / _` |/ _ \ | ___ \ |/ _ \ / __| |/ / __|
| |  | | |    | \__/\ (_) | (_| |  __/ | |_/ / | (_) | (__|   <\__ \
\_|  |_/_|     \____/\___/ \__,_|\___| \____/|_|\___/ \___|_|\_\___/
                                                                    
******************************************************************************************************************
___  ___            _                   _____                   _   _       _       _____           _       _    *
|  \/  |           (_)                 |  ___|                 | | (_)     | |     /  ___|         (_)     | |   *
| .  . | __ _ _ __  _  __ _ _ __ ___   | |__ ___ ___  ___ _ __ | |_ _  __ _| |___  \ `--.  ___ _ __ _ _ __ | |_  *
| |\/| |/ _` | '_ \| |/ _` | '__/ _ \  |  __/ __/ __|/ _ \ '_ \| __| |/ _` | / __|  `--. \/ __| '__| | '_ \| __| *
| |  | | (_| | | | | | (_| | | | (_) | | |__\__ \__ \  __/ | | | |_| | (_| | \__ \ /\__/ / (__| |  | | |_) | |_  *
\_|  |_/\__,_|_| |_| |\__,_|_|  \___/  \____/___/___/\___|_| |_|\__|_|\__,_|_|___/ \____/ \___|_|  |_| .__/ \__| *
                  _/ |                                                                               | |         *
                 |__/                                                                                |_|         *
******************************************************************************************************************


EOF
echo -e "${LIGHTGREEN}Looking for the fastest mirror, please wait!${NOCOLOR}"
sudo pacman-mirrors --fasttrack
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -Syuu
echo -e "${LIGHTGREEN}Installing some essentials stuff... it will take a while...${NOCOLOR}"
sudo pacman -Sy base-devel
sudo pacman -S libcurl4-openssl-dev
sudo pacman -S libssl-dev
sudo pacman -S python-setuptools
sudo pacman -S python3-pip
sudo pacman -S python-pip
sudo pacman -S git
sudo pacman -S wine


echo -e "${LIGHTGREEN}Now installing Java stuff...${NOCOLOR}"

sudo pacman -sS java | grep jre
sudo pacman -S jre-openjdk
sudo pacman -sS java | grep jdk
sudo pacman -S jdk-openjdk

echo -e "${LIGHTGREEN}Java stuff installed!${NOCOLOR}"

#Silos install

echo -e "${LIGHTGREEN}Installing Silos Web app container...${NOCOLOR}"

git clone https://aur.archlinux.org/silos.git
cd silos
makepkg -sci
cd ..

echo -e "${LIGHTGREEN}Done!${NOCOLOR}"

# Snapd install

echo -e "${LIGHTGREEN}Creating a new dir and installing snapd...${NOCOLOR}"

mkdir ~/manjaro_script_tools
cd ~/manjaro_script_tools/
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -sci
cd ~/manjaro_script_tools/
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
# Add black arch repository to manjaro packet manager

read -p -e "${LIGHTGREEN}Do you need pentesting tools? (y/n)?${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's add the black arch repository to your packet manager then${NOCOLOR}";
  sudo su && curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh
  echo -e "${LIGHTGREEN}Done! Check your packet manager now${NOCOLOR}"
  exit
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install Microsoft Teams

read -p -e"${LIGHTGREEN}If you are a student maybe you need Microsoft Teams (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's install it then${NOCOLOR}";
  git clone https://aur.archlinux.org/teams.git
  cd teams 
  makepkg -sci
  cd ~/manjaro_script_tools/
  echo  -e "${LIGHTGREEN}Done! Teams is ready for you${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install NordVPN CLI Version

read -p -e"${LIGHTGREEN}Yo mate, do you need NordVPN for extra protection? (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's install it then${NOCOLOR}";
  git clone https://aur.archlinux.org/nordvpn-bin.git
  cd nordvpn-bin
  echo -e "${LIGHTGREEN}What is your system username?:${NOCOLOR} "
  read first_name
  echo -e "${LIGHTGREEN}So you are $first_name , ok thanks, now we can install NordVPN${NOCOLOR}" 
  sudo groupadd -r nordvpn
  makepkg -sci
  sudo gpasswd -a $first_name nordvpn
  sudo systemctl enable --now nordvpnd
  cd ~/manjaro_script_tools/
  systemctl enable nordvpnd.service
  systemctl start nordvpnd.service
  echo -e "${LIGHTGREEN}Done! NordVPN is ready${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install Balena Etcher

read -p -e "${LIGHTGREEN}Now is time for Balena Etcher, this program will allow you to flash OS images to flash drives and sd cards quickly and safely.. Do you want it?  (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's install it then${NOCOLOR}";
  git clone https://aur.archlinux.org/etcher-bin.git
  cd etcher-bin
  makepkg -sci
  sudo chmod 4755 /opt/balenaEtcher/chrome-sandbox
  cd ~/manjaro_script_tools/
  echo -e "${LIGHTGREEN}Done! Balena Etcher is ready for you${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install PlayOnLinux


read -p -e "${LIGHTGREEN}I have this very useful tool to offer you. It will allow you to install some applications present in the Windows environment, it is PlayOnLinux, do you need it?  (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's install it then${NOCOLOR}";
  sudo pacman -S playonlinux
  echo -e "${LIGHTGREEN}Done! Balena Etcher is ready for you${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install Visual Studio Code

read -p -e "${LIGHTGREEN} If you are a programmer I have this program for you, Visual Studio Code. Do you need it?  (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's install it then${NOCOLOR}";
  git clone https://aur.archlinux.org/visual-studio-code-bin.git
  cd visual-studio-code-bin
  makepkg -sci
  cd ~/manjaro_script_tools/
  echo -e "${LIGHTGREEN}Done! Visual Studio Code is ready for you!${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi


#Install Discord

read -p -e "${LIGHTGREEN}if you are a gamer you will probably need discord (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e"${LIGHTGREEN}let's install it then${NOCOLOR}";
  sudo snap install discord
  echo -e"${LIGHTGREEN}Done! Discord is ready for you${NOCOLOR}"
else
  echo -e"${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install Spotify

read -p -e"${LIGHTGREEN}I love music and you? I have the Spotify app for you (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}let's install it then${NOCOLOR}";
  sudo snap install spotify
  echo -e "${LIGHTGREEN}Done! Spotify is ready for you${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

#Install GeForce Now

read -p -e "${LIGHTGREEN}Hey gamer, do you need GeForce Now? (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e"${LIGHTGREEN}let's install it then${NOCOLOR}";
  sudo snap install geforcenow
  echo -e"${LIGHTGREEN}Done! Discord is ready for you${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";
fi

	
#Install adobe acrobat pdf reader


read -p "${LIGHTGREEN}Do you need a PDF Reader? (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
	echo -e "${LIGHTGREEN}let's install Adobe Acrobat then${NOCOLOR}";
	git clone https://aur.archlinux.org/acroread.git
	cd acroread
	makepkg -sci
	cd ~/manjaro_script_tools/
	echo -e "${LIGHTGREEN}Done! Adobe Acrobat is ready for you${NOCOLOR}"
else
	echo -e "${LIGHTGREEN} Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";

#Install Telegram Desktop

read -p -e "${LIGHTGREEN}Do you need a Telegram Desktop? (one of the most popular messaging apps) (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
	echo -e "${LIGHTGREEN}let's install Telegram Desktop${NOCOLOR}";
	sudo snap install telegram-desktop
	echo -e "${LIGHTGREEN}Done! Telegram is ready for you${NOCOLOR}"
else
	echo -e "${LIGHTGREEN} Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";

#Install Whatsapp Desktop

read -p -e "${LIGHTGREEN}Do you need a Whatsapp Desktop? (one of the most popular messaging apps) (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
	echo -e "let's install Whatsapp Desktop${NOCOLOR}";
	git clone https://aur.archlinux.org/whatsapp-for-linux.git
	cd whatsapp-for-linux
	makepkg -sci
	cd ~/manjaro_script_tools/
	echo -e "${LIGHTGREEN}Done! Whatsapp is ready for you${NOCOLOR}"
else
	echo -e "${LIGHTGREEN} Oh ok no problem, I have other interesting stuff for you!${NOCOLOR}";

echo -e "${LIGHTGREEN}DONE!! This is the end of the script, please reboot the system!${NOCOLOR}"

echo -e "${LIGHTGREEN}But first, let's do a quick update...${NOCOLOR}"
sudo pacman -Sy && sudo pacman -Syu && sudo pacman -Syuu
echo -e "${LIGHTGREEN}This Script is made by ----------------MrCodeBlocks-----------------${NOCOLOR}"
echo -e "${LIGHTGREEN}Check also this site https://archlinux.org/ for other apps${NOCOLOR}"
read -p "${LIGHTGREEN}Reboot the system now? (y/n)${NOCOLOR}" CONT
if [ "$CONT" = "y" ]; then
  echo -e "${LIGHTGREEN}Ok thanks!${NOCOLOR}";
  sudo reboot 0
  echo -e "${LIGHTGREEN}See Ya${NOCOLOR}"
else
  echo -e "${LIGHTGREEN}Oh ok no problem, Reboot it later${NOCOLOR}";
fi












