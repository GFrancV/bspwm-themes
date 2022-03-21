#!/usr/bin/bash
iniRoute=$(pwd)
scriptRoute=$iniRoute/scripts/only-config/file-configs.sh

options=("kitty" "bspwm" "sxhkd" "rofi" "polybar" "picom")

echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mInstall all configurations\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"
echo "Checking files..."

for arrayOption in "${options[@]}"
do
    $scriptRoute $arrayOption
done
            
mkdir -p ~/Images/Wallpapers
echo -e "\e[34m[✓] Copyng the wallpapers...\e[0m\n"
cp $iniRoute/images/wallpapers/* ~/Images/Wallpapers

./scripts/theme-selector.sh