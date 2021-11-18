#!/bin/bash
#Load the necessary a local variables
usrName=$(whoami)
iniRoute=$(pwd)

#Menu options
options=("Auto install" "Custom configuration" "Install all packets (not recomended)")

basicConfig (){
    echo -e "\e[1;33m **************************************** \e[0m"
    echo -e "        \e[1;33mBasic Configuration\e[0m"
    echo -e "\e[1;33m **************************************** \e[0m"
    
    #
    #Install the necessarie tools
    #
    echo -e "\e[34mInstalling the necessarie tools!\e[0m"
    sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

    echo

    #
    #Install bspwm and sxhkd
    #
    echo -e "\e[34mCreating the arrival folder (Downloads). \e[0m"
    mkdir ~/Downloads
    echo -e "\e[34mCloning bspwm repo. \e[0m"
    echo "Cloning bspwm repo."
    git clone https://github.com/baskerville/bspwm.git ~/Downloads/bspwm
    echo -e "\e[34mCloning sxhkd repo. \e[0m"
    git clone https://github.com/baskerville/sxhkd.git ~/Downloads/sxhkd

    echo

    echo -e "\e[34mMaking bspwm. \e[0m"
    cd ~/Downloads/bspwm
    make
    sudo make install

    echo -e "\e[34mMaking sxhxd.\e[0m"
    cd ~/Downloads/sxhkd
    make

    echo -e "\e[34mInstalling bspwm.\e[0m"
    sudo apt install bspwm

    echo

    #
    #Copy the necessary files
    #
    echo -e "\e[34mCreating the config folders.\e[0m"
    mkdir ~/.config/bspwm
    mkdir ~/.config/sxhkd

    echo -e "\e[34mCopy bspwm configs.\e[0m"
    cd $iniRoute
    cp config-files/bspwmrc ~/.config/bspwm/
    echo -e "\e[34mCopy sxhkd configs and required scripts.\e[0m"
    cp config-files/sxhkdrc ~/.config/sxhkd/
    cp -r config-files/scripts ~/.config/bspwm/

}

customConfig (){
    echo "2"
}

allConfig (){
    echo "3"
}

#Clean the terminal
clear

#Title menu
echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mStarting the configuration\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"
echo "Installation wizard. For more information read README.MD file."
echo "Select a option configuration for your Linux."

#Print options menu
for arrayOption in "${options[@]}"
do
    ((optNum++))
    echo -e "\e[34m$optNum.\e[0m \e[1;34m$arrayOption\e[0m"
done

#Read the user selected option
read -p "Select one option: " op

case $op in
    1)clear
        basicConfig
        ;;

    2)clear
        customConfig
        ;;

    3)clear
        allConfig
        ;;

    *) echo -e "\e[31m$op is not valid!\e[0m"
        ;;
esac

