#!/bin/bash
#Routes
iniRoute=$(pwd)

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
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt update

#Need to load walpapers
echo -e "\e[34mInstalling the necessarie tools to load wallpapers!\e[0m"
sudo apt install feh
sudo apt update

#Need to polybar
echo -e "\e[34mInstalling the necessarie tools to polybar!\e[0m"
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
sudo apt update

#Need to picom
echo -e "\e[34mInstalling the necessarie tools to picom!\e[0m"
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
sudo apt update

echo

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
sudo apt install bspwm
sudo apt update

echo

#Move to dotfile route
cd $iniRoute

#
#Copy the necessary files
#
echo -e "\e[34mCreating the config folders.\e[0m"
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

echo -e "\e[34mCopy sxhkd configs and required scripts.\e[0m"
cp config-files/window-manager/sxhkdrc ~/.config/sxhkd/
cp -r config-files/window-manager/scripts ~/.config/bspwm/

echo -e "\e[34mCreating the wallpapers folder.\e[0m"
mkdir ~/Images
mkdir ~/Images/Wallpapers

#Add wallpaper to bspwm
echo -e "\e[34mCopyng the wallpapers.\e[0m"
cp images/wallpapers/* ~/Images/Wallpapers

#
#Select theme to install
#
./scripts/theme-selector.sh

#
#Installing polybar
#
echo -e "\e[34mInstalling polybar.\e[0m"
sudo apt install polybar
sudo apt update


#Move to dotfile route
cd $iniRoute


#
#Installing polybar-theme
#
echo -e "\e[34mCloning the polybar-themes repo.\e[0m"
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git ~/Downloads/polybar-themes
cd ~/Downloads/polybar-themes

echo -e "\e[34Chmod to setup.sh of polybar-themes.\e[0m"
chmod +x setup.sh

echo -e "\e[34Running polybar-themes.\e[0m"
echo -e "Note: Install option 1!"
./setup.sh

echo -e "\e[34Copying custom polybar-themes configurations.\e[0m"
cd $iniRoute
rm -R ~/.config/polybar/hack ~/.config/polybar/grayblocks
cp -r config-files/polybar-themes/* ~/.config/polybar/


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
cp config-files/picom.conf ~/.config/picom/


#Move to dotfile route
cd $iniRoute


#
#Installing rofi
#
echo -e "\e[34mInstalling rofi.\e[0m"
sudo apt install rofi

echo -e "\e[34mNOTE: Before the installation of rofi please view README.MD to cchange rofi theme.\e[0m"

