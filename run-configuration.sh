#!/bin/bash

#Load the necessary a local variables
usrName=$(whoami)
iniRoute=$(pwd)

#
#Install the necessarie tools
#
apt instal l build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev


#
#Install bspwm and sxhkd
#
echo "Creating the arrival folder."
mkdir ~/Downloads
echo "Cloning bspwm repo."
git clone https://github.com/baskerville/bspwm.git ~/Downloads/bspwm
echo "Cloning sxhkd repo."
git clone https://github.com/baskerville/sxhkd.git ~/Downloads/sxhkd

echo "Making bspwm."
cd ~/Downloads/bspwm
make
sudo make install

echo "Making sxhxd."
cd ~/Downloads/sxhkd
make

echo "Installing bspwm."
sudo apt install bspwm


#
#Copy the necessary files
#
echo "Creating the config folders."
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

echo "Copy bspwm configs."
cd $iniRoute
cp config-files/bspwmrc ~/.config/bspwm/
echo "Copy sxhkd configs and required scripts."
cp config-files/sxhkdrc ~/.config/sxhkd/
cp config-files/scripts ~/.config/bspwm/


#
#Install polybar
#
echo "Installing the necessary files for polybar."
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

echo "Installing polybar"
git clone --recursive https://github.com/polybar/polybar ~/Downloads/polybar
mkdir ~/Downloads/polybar/build
cd ~/Downloads/polybar/build
cmake ..
make -j$(nproc)
sudo make install


#
#Install picom
#
echo "Installing picom"
git clone https://github.com/ibhagwan/picom.git ~/Downloads/picom
cd ~/Downloads/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

echo "Picom necessary files."
mkdir ~/.config/picom
cd $iniRoute
cp config-files/picom.conf ~/.config/picom


#
#Install oh-my-zsh
#
#echo "Installing oh-my-zsh"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#echo "Download powerlevel10k theme for oh-my-zsh."
#git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

#echo "Now set manually power level 10k as a default theme (for more help read README.MD)."




#Intall the essential tools
echo "Installing brightnessctl"
sudo apt install brightnessctl

echo "Installing feh"
sudo apt install feh

#Customazing

#Wallpaper configuration
echo "Setting the wallpaper"
echo "Creating the folder Images."
mkdir ~/Images
echo "Copying the wallpapers to local directory."
cp images/wallpapers ~/Images
echo "By default the wallpaper-abstergo was defined."

