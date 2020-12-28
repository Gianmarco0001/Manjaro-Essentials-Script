#!/bin/bash
# This script is created by MrCodeBlocks.
cat << "EOF"


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
echo "Installing some essentials stuff... it will take a while..."
sudo pacman-mirrors --fasttrack
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -Syuu

sudo pacman -Sy base-devel
sudo pacman -S libcurl4-openssl-dev
sudo pacman -S libssl-dev
sudo pacman -S python-setuptools
sudo pacman -S python3-pip
sudo pacman -S python-pip
sudo pacman -S git
sudo pacman -S wine
sudo pacman -Syu gcc

echo "now installing Java stuff..."

sudo pacman -sS java | grep jre
sudo pacman -S jre-openjdk
sudo pacman -sS java | grep jdk
sudo pacman -S jdk-openjdk

echo "Java stuff installed!"

#Silos install

echo "Installing Silos Web app container..."

git clone https://aur.archlinux.org/silos.git
cd silos
makepkg -sci
cd ..

echo "Done!"

# Snapd install

echo "creating a new dir and installing snapd..."

mkdir ~/manjaro_script_tools
cd ~/manjaro_script_tools/
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -sci
cd ~/manjaro_script_tools/
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
# Add black arch repository to manjaro packet manager

read -p "Do you need pentesting tools? (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "let's add the black arch repository to your packet manager then";
  curl -O https://blackarch.org/strap.sh
  chmod +x strap.sh
  ./strap.sh
  echo "Done! Check your packet manager now"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install Microsoft Teams

read -p "If you are a student maybe you need Microsoft Teams (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  git clone https://aur.archlinux.org/teams.git
  cd teams 
  makepkg -sci
  cd ~/manjaro_script_tools/
  echo "Done! Teams is ready for you"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install NordVPN CLI Version

read -p "Yo mate, do you need NordVPN for extra protection? (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  git clone https://aur.archlinux.org/nordvpn-bin.git
  cd nordvpn-bin
  echo "What is your system username?: "
  read first_name
  echo "So you are $first_name , ok thanks, now we can install NordVPN" 
  sudo groupadd -r nordvpn
  makepkg -sci
  sudo gpasswd -a $fist_name nordvpn
  sudo systemctl enable --now nordvpnd
  cd ~/manjaro_script_tools/
  systemctl enable nordvpnd.service
  systemctl start nordvpnd.service
  echo "Done! NordVPN is ready"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install Balena Etcher

read -p "Now is time for Balena Etcher, this program will allow you to flash OS images to flash drives and sd cards quickly and safely.. Do you want it?  (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  git clone https://aur.archlinux.org/etcher-bin.git
  cd etcher-bin
  makepkg -sci
  sudo chmod 4755 /opt/balenaEtcher/chrome-sandbox
  cd ~/manjaro_script_tools/
  echo "Done! Balena Etcher is ready for you"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install PlayOnLinux


read -p "I have this very useful tool to offer you. It will allow you to install some applications present in the Windows environment, it is PlayOnLinux, do you need it?  (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  sudo pacman -S playonlinux
  echo "Done! Balena Etcher is ready for you"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install Visual Studio Code

read -p " If you are a programmer I have this program for you, Visual Studio Code. Do you need it?  (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  git clone https://aur.archlinux.org/visual-studio-code-bin.git
  cd visual-studio-code-bin
  makepkg -sci
  cd ~/manjaro_script_tools/
  echo "Done! Visual Studio Code is ready for you!"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi


#Install Discord

read -p "if you are a gamer you will probably need discord (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  sudo snap install discord
  echo "Done! Discord is ready for you"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install Spotify

read -p "I love music and you? I have the Spotify app for you (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  sudo snap install spotify
  echo "Done! Spotify is ready for you"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install GeForce Now

read -p "Hey gamer, do you need GeForce Now? (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "let's install it then";
  sudo snap install geforcenow
  echo "Done! Discord is ready for you"
else
  echo "Oh ok no problem, I have other interesting stuff for you!";
fi

#Install Firefox

read -p "Do you need Firefox? (y/n)" CONT
if [ "$CONT" = "y" ]; then
	echo "let's install it then";
	sudo snap install firefox
	echo "Done! Firefox is ready for you"
else
	echo " Oh ok no problem, I have other interesting stuff for you!";
	
#Install adobe acrobat pdf reader


read -p "Do you need a PDF Reader? (y/n)" CONT
if [ "$CONT" = "y" ]; then
	echo "let's install Adobe Acrobat then";
	git clone https://aur.archlinux.org/acroread.git
	cd acroread
	makepkg -sci
	cd ~/manjaro_script_tools/
	echo "Done! Adobe Acrobat is ready for you"
else
	echo " Oh ok no problem, I have other interesting stuff for you!";

#Install Telegram Desktop

read -p "Do you need a Telegram Desktop? (one of the most popular messaging apps) (y/n)" CONT
if [ "$CONT" = "y" ]; then
	echo "let's install Telegram Desktop";
	sudo snap install telegram-desktop
	echo "Done! Telegram is ready for you"
else
	echo " Oh ok no problem, I have other interesting stuff for you!";

#Install Whatsapp Desktop

read -p "Do you need a Whatsapp Desktop? (one of the most popular messaging apps) (y/n)" CONT
if [ "$CONT" = "y" ]; then
	echo "let's install Whatsapp Desktop";
	git clone https://aur.archlinux.org/whatsapp-for-linux.git
	cd whatsapp-for-linux
	makepkg -sci
	cd ~/manjaro_script_tools/
	echo "Done! Whatsapp is ready for you"
else
	echo " Oh ok no problem, I have other interesting stuff for you!";

echo "DONE!! This is the end of the script, please reboot the system!"

echo "But first, let's do a quick update..."
sudo pacman -Sy && sudo pacman -Syu && sudo pacman -Syuu
echo "This Script is made by ----------------MrCodeBlocks-----------------"
echo "Check also this site https://archlinux.org/ for other apps"
read -p "Reboot the system now? (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo "Ok thanks!";
  sudo reboot 0
  echo "See Ya"
else
  echo "Oh ok no problem, Reboot it later";
fi

cat << "EOF"



___  ___       _____           _       ______ _            _        
|  \/  |      /  __ \         | |      | ___ \ |          | |       
| .  . |_ __  | /  \/ ___   __| | ___  | |_/ / | ___   ___| | _____ 
| |\/| | '__| | |    / _ \ / _` |/ _ \ | ___ \ |/ _ \ / __| |/ / __|
| |  | | |    | \__/\ (_) | (_| |  __/ | |_/ / | (_) | (__|   <\__ \
\_|  |_/_|     \____/\___/ \__,_|\___| \____/|_|\___/ \___|_|\_\___/
                                                                    
                                                                    


MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMM7I7?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMM$ZZZZZZZZ$ZZZ$$$$$7~.,~MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMM$ZZZZZOZOOOOOOO88OOOZZZOOIMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMM?ZZZZZOOOOOOOOOOO8888OOOOZO8O=MMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMM$$$$OOOOOOOZOOOOOOZO8OOOO8OO8DOO+MMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMM$$$$ZOOOOZZOOOOOZOOOZOOZZO8OOZ888O7MMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMIO7$$ZOOZZZZZZOZOOOOOOZZOOOZZ$O8D88OZMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMM8O7$ZZZZZ$ZZ$$ZZOOOOOOOOO8OOOZ8DD88OOIMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMDDZ$ZZ$$ZZO88888OOOOOOOZZO8O8DDDD8OOOO?MMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMIOOZOOOO888DNNDO$$7$ZZOOZOZOOO8888OOOOOO=MMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMIOO888888Z$$ZZ$$$7I?I$ZZOZOOOOOOOOOOOOOOZMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMZO88888OOZ$77IIIII????7$$ZZZOOOOOOOOOOOOOOZ+MMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMM+O8DD8OOZZZZ$7III???????7$$$ZZZZOOOOOOOZOOOO8O?MMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMM?DDDD88ZZZZZ$$$$777I?????I777$$ZOZZOOOOOOOOOOOOOOIMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMZDNDNNNDZ$Z$Z$ZZOZZ77I7I7I777$$$ZZOOOOOOOOOOOOOOOOOZ=MMMMMMMMMMMMMMM
MMMMMMMMMMMM$DNNNDNOZZ$$$OODN8OZ7IIIIII7$$ZZZOOOOOOOOOOOOOOOOOOOIMMMMMMMMMMMMMMM
MMMMMMMMMMMMM?OD888OZZZ8O8NDOZZ$7IIII777$ZZZOZOOZOOO8OOOZOOOOOOZ$=MMMMMMMMMMMMMM
MMMMMMMMMMMMMMM+7ZO888O88OOZZZ77IIIII7$$$ZZZOZOOOOOO8OOOOOZOOOOOO7MMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMM=ZZZOZZ$77IIIIII77$ZZZOOOOOOO888OOOOOOOZOOZOOOZIMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMM7$$$$7777IIII777$$$ZOZOOOOOO88OOOOOZOOOOOOOOO88Z=MMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMI7777III777777$$ZZZOOOOOOOO8OOOOOOZOOOOOOOOOO8888$?MMMMMMMM
MMMMMMMMMMMMMMMMMMMMMI77777777777$$$ZZZZOOOOOOOOOOOOZZOZZZZOOZOO8888888OO+MMMMMM
MMMMMMMMMMMMMMMMMMMMMI777I77IIII77$ZZZZZOZOOOZOOZZZZZZZZOZZZOO88888OO888OO=MMMMM
MMMMMMMMMMMMMMMMMMMMMIIIIII77IIIII$$$$ZZZZZZZZZZ$ZZ$Z$ZZZZOOO88888O8888OOO?MMMMM
MMMMMMMMMMMMMMMMMMMMMII7IIIIIIIIII77$$$ZZ$$$$$$$$$$$$ZZZZOO8O88O8O8888OOOOZ=MMMM
MMMMMMMMMMMMMMMMMMMMM?IIIIIIIII??II7$$$$$$$$$777$$$$$$ZZOOOOOOO8OO8888OOOOO$MMMM
MMMMMMMMMMMMMMMMMMMM=IIIIIIIIIIIIII77777777777$$$$Z$ZZOOZZOOOOOO8D888OOOOOO8+MMM
MMMMMMMMMMMMMMMMMMMM=IIIIIIIIIIIIIIIII777777$$$ZZZZZZZZZZZOOOOO88D88OOOOOO88OMMM
MMMMMMMMMMMMMMMMMMMM=IIIIIIIIIIIIIIIII7777$$$$$$$Z$Z$$$ZZZOOOOO88D8OOOOOOO8DD$MM
MMMMMMMMMMMMMMMMMMMM+I77IIIIII7IIIIIII77$$77$$$$$$$$$$$$ZZOOOO8O88OOOOOO888DD8=M
MMMMMMMMMMMMMMMMMMMM=II7777IIIIII7777777777III7777777$$ZOOOOOO8888OOOOOO888888OM
MMMMMMMMMMMMMMMMMMMM=II777777IIIII7I77I77777I77I7777$7$ZOOOOO88O8OOOOO8O888888+M
MMMMMMMMMMMMMMMMMMMM=77777777IIIIIIIIII77777II777777$ZOOOOOO88888OOOOO8888888?MM
MMMMMMMMMMMMMMMMMMMMMI777$7$77IIII7III777777777777$$ZOOOOOO8888OOOOOO8888888IMMM
MMMMMMMMMMMMMMMMMMMMM?$$$$$Z$77III777777777777777$$ZZOOOOOOO8888OOZO888888D?MMMM
MMMMMMMMMMMMMMMMMMMMM?Z$Z$ZZZ$77I777777$$$$$$$$$$ZZOOOOOO888888OOOOOO88887MMMMMM
MMMMMMMMMMMMMMMMMMMMM+ZZ$$$$$$$$77777$$$$$$$$$$ZZOZOOOOOO8O888O8OOOOO8O?MMMMMMMM
MMMMMMMMMMMMMMMMMMMMM+ZZ$$$$$$$$$777777$$$$$$ZZZOOOOOOOOOOO8888O8O888O8=MMMMMMMM
MMMMMMMMMMMMMMMMMMMMM?Z$$$$$777$$$$$$77$77$$ZZZZOOOOOOOO8888888OOOOO888+MMMMMMMM
MMMMMMMMMMMMMMMMMMMMM?Z$$$$$777$$$$$$$$$$$7$$ZZZOOOOOO8888888888O888DD8MMMMMMMMM
MMMMMMMMMMMMMMMMMMMMM?Z$$777777$ZOZZ$$$$$$Z$$$ZZZZOOOOO88DD8888888888DZMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMIZ$7777I7$ZO88OZZZZZZZZ$$ZZZOOOOOO88DDDD888888888$MMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMIZ$$77I77ZOODD8ZZZZZZZZ$$ZZZZOZOOO88DDDD88888888D7MMMMMMMMM
MMMMMMMMMMMMMMMMMM+777Z$$77I77ZO88888OZZZZZZZ$$ZZZZOOOO88DDDDDD88888DD+MMMMMMMMM
MMMMMMMMMMMM=+I7$ZZZZZZ$$7777$O8888888ZZ$ZZZZ$$ZZZZOOOOOODDDDDD88888DOMMMMMMMMMM
MMMMMMMMM?777$$ZZZOZZO$$$$$77ZO888DDOZ$$$$$ZZ$$$ZZZOOOOO8DDDDD88888DDIMMMMMMMMMM
MMMMMMM7$77$$$ZZOOOO7I$$$$77$ZZO88ZZ$$$$7$$7$$$ZZZZOOOOO8DDDDD88DDDDZ=MMMMMMMMMM
MMMMMM?88$ODZOZ$?MMMM?$$$$$$ZOOOOZ$$$$$$$7777$$ZZZOOOOOO88DDDDD88DO?MMMMMMMMMMMM
MMMMMMM+7+$O7MMMMMMMM7$$$ZZZOOOOZ$$$777777777$$ZZZOO88888DDDDDD8IMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMM$Z$$$$ZO88OZ$77777777777$$ZZZOOO8888DDNNDO+MMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMIZZZ$$$ZZZZOOZ77777I77777$$Z$ZZZZO88O88DDD8+MMMMMMMMMMMMMMMMMMM
MMMMMMMMMM?I$$ZZOOZ$$$$$ZZ$?$Z77I7II777$$ZZOZZZZZOOO888$:=MMMMMMMMMMMMMMMMMMMMMM
MMMMMMMZZZZZZZZZZ$$$$$$$Z+MMMMMMMMMMMMMMMMMMOZZZOOO888=MMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMM8DDOZ$$$O$77$$$$7$+MMMMMMMMMMMMMMMMMMM7$ZZOO888+MMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMI$ZZ$Z$7$$$77777+MMMMMMMMMMMMMMMMMMMMM?ZZZZZO8ZMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMIZZ7$$$$7$$$$7MMMMMMMMMMMMMMMMMMMMMMM+$ZZZOO8IMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMM+O$$$ZZ$ZZZMMMMMMMMMMMMMMMMMMMMMMMMM7ZZZZOOO?MMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMI$$$$??=MMMMMMMMMMMMMMMMMMMMMMMMMM$$ZZZOOO?MMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                                                                 



EOF






