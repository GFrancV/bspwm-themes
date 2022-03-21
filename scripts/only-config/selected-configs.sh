#!/usr/bin/bash
iniRoute=$(pwd)
scriptRoute=$iniRoute/scripts/only-config/file-configs.sh

#Settings options
options=("kitty" "bspwm" "sxhkd" "wallpapers" "rofi" "polybar" "picom" "Exit")

echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mSelect configurations\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"
echo -e "\e[1;33mSelect files to install\e[0m"
echo "For more information about options you can view the README.MD file."
echo "What settings do you want to install?"


#Print options menu
for arrayOption in "${options[@]}"
do
    ((optNum++))
    echo -e "\e[34m$optNum.\e[0m \e[1;34m$arrayOption\e[0m"
done

while true; do
    #Read the user selected option
    read -p "Select settings: " op

    case $op in
        1)
            $scriptRoute $options[$op]
            ;;
        
        3)
            mkdir -p ~/Images/Wallpapers
            echo -e "\e[34m[✓] Copyng the wallpapers...\e[0m\n"
            cp $iniRoute/images/wallpapers/* ~/Images/Wallpapers
            ;;

        *) echo -e "\e[31m$op is not valid!\e[0m"
            ;;
    esac    

    [[ $op -gt 8 || $op -lt 1 ]] || break
done
