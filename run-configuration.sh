#!/bin/bash

#Load the username in a local variable
usrName=$(whoami)

echo "Starting the configuration!"
echo "$usrName"

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

