#!/bin/bash
#Routes
iniRoute=$(pwd)

#Color yellow
#   echo -e "\e[1;33m(Text)\e[0m"
#Sky blue color
#   echo -e "\e[34m(Text)\e[0m"

#Themes options
options=("All configs")

echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mInstall only configurations\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"

#Title menu
echo -e "\e[1;33mOption selector\e[0m"
echo "For more information about options you can view the README.MD file."
echo "What do you want to do?"

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
        1)clear
            ./scripts/only-config/all-configurations.sh
            ;;

        2)clear
            # ./scripts/only-config/selected-configs.sh
            ;;

        *) echo -e "\e[31m$op is not valid!\e[0m"
            ;;
    esac    

    [[ $op -gt 2 || $op -lt 1 ]] || break
done