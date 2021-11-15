#!/bin/bash

#Load the necessary a local variables
usrName=$(whoami)
iniRoute=$(pwd)

echo "Starting the configuration!"


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
git clone https://github.com/baskerville/bspwm.git ~/Downloads
echo "Cloning sxhkd repo."
git clone https://github.com/baskerville/sxhkd.git ~/Downloads

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

