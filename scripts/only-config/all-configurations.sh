#!/usr/bin/bash
iniRoute=$(pwd)
scriptRoute=$iniRoute/scripts/only-config/file-configs.sh


echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mInstall all configurations\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"
echo "Checking files..."

$scriptRoute kitty
$scriptRoute bspwm
$scriptRoute sxhkd
            
mkdir -p ~/Images/Wallpapers
echo -e "\e[34m[✓] Copyng the wallpapers...\e[0m"
cp $iniRoute/images/wallpapers/* ~/Images/Wallpapers

$scriptRoute rofi
$scriptRoute polybar
$scriptRoute picom

./scripts/theme-selector.sh