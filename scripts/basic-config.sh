#!/bin/bash
#Routes
iniRoute=$(pwd)
configFilesRoute=config-files/dotfiles
configRoute=~/.config

#Color yellow
#   echo -e "\e[1;33m(Text)\e[0m"
#Sky blue color
#   echo -e "\e[34m(Text)\e[0m"

echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mBasic Configuration\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"

#
#Install the necessarie tools
#
echo -e "\e[34mInstalling the necessarie tools!\e[0m"
#Necessary tool for bspwm
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt update

#Need to load walpapers
echo -e "\e[34mInstalling the necessarie tools to load wallpapers!\e[0m"
sudo apt install feh -y
sudo apt update

#Need to polybar
echo -e "\e[34mInstalling the necessarie tools to polybar!\e[0m"
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
sudo apt update

#Need to picom
echo -e "\e[34mInstalling the necessarie tools to picom!\e[0m"
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
sudo apt update

echo

#
#Install NERD FONT HACK font
#
echo -e "\e[34mInstalling necesary Fonts.\e[0m"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -P $iniRoute/fonts

echo -e "\e[34mUnziping.\e[0m"
unzip $iniRoute/fonts/Hack.zip -d $iniRoute/fonts/Hack
sudo cp $iniRoute/fonts/* /usr/share/fonts

echo -e "\e[34minstalling fonts.\e[0m"
fc-cache -f -v

cd $iniRoute

#
#Install kitty and configurations
#
echo -e "\e[34mInstalling kitty.\e[0m"
sudo apt install kitty -y
echo -e "\e[34mInstalling zsh.\e[0m"
sudo apt install zsh -y

echo -e "\e[34mInstalling oh-my-zsh.\e[0m"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo -e "\e[34mCloning powerlevel10k repo.\e[0m"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo -e "\e[34mCopy p10k configs.\e[0m"
cp $configFilesRoute/.p10k.zsh ~/ 
cp $configFilesRoute/.zshrc ~/

echo -e "\e[34mCopy kitty configs.\e[0m"
cp -r $configFilesRoute/kitty ~/.config/

#
#Install ranger and configurations
#
echo -e "\e[34mINstalling ranger. \e[0m"
sudo apt install ranger -y
echo -e "\e[34mCreating the basics configs for ranger.\e[0m"
ranger --copy-config=all
echo -e "\e[34mInstalling devicons.\e[0m"
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
cp $configFilesRoute/ranger/rc.conf ~/.config/ranger/


#
#Install bspwm and sxhkd
#
echo -e "\e[34mCreating the arrival folder (Downloads). \e[0m"
mkdir ~/Downloads
echo -e "\e[34mCloning bspwm repo. \e[0m"
echo "Cloning bspwm repo."
git clone https://github.com/baskerville/bspwm.git ~/Downloads/bspwm
echo -e "\e[34mCloning sxhkd repo. \e[0m"
git clone https://github.com/baskerville/sxhkd.git ~/Downloads/sxhkd

echo

echo -e "\e[34mMaking bspwm. \e[0m"
cd ~/Downloads/bspwm
make
sudo make install
sudo apt update

echo -e "\e[34mMaking sxhxd.\e[0m"
cd ~/Downloads/sxhkd
make
sudo apt update

echo -e "\e[34mInstalling bspwm.\e[0m"
sudo apt install bspwm -y
sudo apt update

echo

#Move to dotfile route
cd $iniRoute

#
#Copy the necessary files
#
echo -e "\e[34mCopy sxhkd configs and required scripts.\e[0m"
cp -r $configFilesRoute/sxhkd ~/.config/
cp -r $configFilesRoute/bspwm ~/.config/

echo -e "\e[34mCreating the wallpapers folder.\e[0m"
mkdir ~/Images
mkdir ~/Images/Wallpapers

#Add wallpaper to bspwm
echo -e "\e[34mCopyng the wallpapers.\e[0m"
cp images/wallpapers/* ~/Images/Wallpapers

#Move to dotfile route
cd $iniRoute

#
#Installing rofi
#
echo -e "\e[34mInstalling rofi.\e[0m"
sudo apt install rofi -y

echo -e "\e[34mCopyng Rofi configuration.\e[0m"

cp -r config-files/dotfiles/rofi ~/.config/

#
#Select theme to install
#
clear
./scripts/theme-selector.sh

#
#Installing polybar
#
echo -e "\e[34mInstalling polybar.\e[0m"
sudo apt install polybar -y
sudo apt update


#Move to dotfile route
cd $iniRoute

#
#Installing polybar-theme
#
echo -e "\e[34Creating backup of your polybar configs.\e[0m"

mv $configRoute/polybar $configRoute/polybar.old

echo -e "\e[34Copying custom polybar-themes configurations.\e[0m"

cd $iniRoute
{ mkdir $configRoute/polybar;  cp -rf $configFilesRoute/polybar $configRoute}


#Move to dotfile route
cd $iniRoute


#
#Installing picom
#
echo -e "\e[34mCloning the picom repo.\e[0m"
git clone https://github.com/ibhagwan/picom.git ~/Downloads/picom
cd ~/Downloads/picom
git submodule update --init --recursive

echo -e "\e[34mMaking picom.\e[0m"
meson --buildtype=release . build
ninja -C build

echo -e "\e[34mInstalling picom.\e[0m"
sudo ninja -C build install
sudp apt update

echo -e "\e[34mCopying the custom picom configurations.\e[0m"
cd $iniRoute
cp -r $configFilesRoute/picom ~/.config/


