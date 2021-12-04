#!/bin/bash
echo -e "\e[34mEnter to root mode.\e[0m"
su

echo -e "\e[34mInstalling sudo and visudo.\e[0m"
apt install sudo
apt intall visudo

echo -e "\e[34mTo active sudo please change the corret line in /etc/sudoers.\e[0m"
echo -e "\e[34mNOTE: Please view README.MD to more information about this step.\e[0m"


