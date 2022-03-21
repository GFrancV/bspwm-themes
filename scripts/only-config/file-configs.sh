#!/usr/bin/bash
#Routes
iniRoute=$(pwd)
configFiles=$iniRoute/config-files/dotfiles/$1
kRoute=~/.config/$1

if [[ -d "$kRoute" ]]; then
    echo -e "\e[34m- Creating a backup of your $1 configs... \e[0m"
    mv $kRoute $kRoute.old
fi

{ mkdir -p $kRoute; cp -rf $configFiles/* $kRoute; }
echo -e "\e[34m[✓] Successfully installed $1 configs!\e[0m\n"