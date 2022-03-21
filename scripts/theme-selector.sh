#!/bin/bash
#Rotue
iniRoute=$(pwd)

#Themes options
options=("Purple Theme" "Blue theme")

echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mSelect theme to install\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"

#Title menu
echo -e "\e[1;33mTheme selector\e[0m"
echo "For more information about themes you can view the previews in the README.MD files or on preview folder."
echo "Which theme you want to install?"

#Print options menu
for arrayOption in "${options[@]}"
do
    ((optNum++))
    echo -e "\e[34m$optNum.\e[0m \e[1;34m$arrayOption\e[0m"
done

while true; do
    #Read the user selected option
    read -p "Select one option: " op

    case $op in
        1)
            #Cppying the purple configs
            echo -e "\e[34m[✓] Copy bspwm configs.\e[0m"
            cp config-files/window-manager/bspwmrc-purple ~/.config/bspwm/bspwmrc
            
            echo -e "\e[34m[✓] Installing rofi themes.\e[0m"
            echo '@import "~/.config/rofi/themes/rounded-purple-dark.rasi"' > ~/.config/rofi/config.rasi
            ;;

        2)
            #Cppying the purple configs
            echo -e "\e[34m[✓] Copy bspwm configs.\e[0m"
            cp config-files/window-manager/bspwmrc-blue ~/.config/bspwm/bspwmrc

            echo -e "\e[34m[✓] Installing rofi themes.\e[0m"
            echo '@import "~/.config/rofi/themes/rounded-blue-dark.rasi"' > ~/.config/rofi/config.rasi
            ;;

        *) echo -e "\e[31m$op is not valid!\e[0m"
            ;;
    esac    

    [[ $op -gt 2 || $op -lt 1 ]] || break
done
