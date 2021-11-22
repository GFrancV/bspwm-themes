#!/bin/bash
#Color yellow
#   echo -e "\e[1;33m(Text)\e[0m"
#Sky blue color
#   echo -e "\e[34m(Text)\e[0m"

#Purple Theme function
purpleTheme (){
    routeBspwm = ~/.config/bspwm/bspwmrc

    #Add wallpaper to bspwm
    echo -e "\e[34mAdding the wallpaper.\e[0m"
    cp images/wallpapers/wallpaper-purple.png ~/Images/Wallpapers
    echo "#Load Wallpaper" > $routeBspwm
    echo "feh --bg-fill ~/Images/Wallpapers/wallpaper-purple.png" > $routeBspwm

    #Add polybar to bspwmrc
    echo -e "\e[34mCoping the polybar configs.\e[0m"
    echo "#Launch Polybar" > $routeBspwm
    echo "~/.config/polybar/./launch.sh --grayblocks" > $routeBspwm
    

    #CORREGIR SOLO AGREGAR AL FINAL DE LA LINEA
    #Add border bspwmrc
    echo -e "\e[34mCopying colors to bspwm.\e[0m"
    echo "#Color in the borders when the app is active" > $routeBspwm
    bspc config focused_border_color "#5e35b2"
    bspc config normal_border_color "#21262b"
    bspc config presel_feedback_color "#5e35b2"
}



#Themes options
options=("Purple Theme" "Blue theme")


echo -e "\e[1;33m **************************************** \e[0m"
echo -e "        \e[1;33mBasic Configuration\e[0m"
echo -e "\e[1;33m **************************************** \e[0m"

<<COMMENT

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
COMMENT

<<COMMENT

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

echo -e "\e[34mCreating the wallpapers folder.\e[0m"
mkdir ~/Images
mkdir ~/Images/Wallpapers

COMMENT

#
#Select theme to install
#

#Title menu
echo -e "\e[1;33mTheme selector\e[0m"
echo "For more information about themes you can view the previes in the README.MD files or on preview folder."
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
        1)clear
            purpleTheme
            ;;

        2)clear
            ./scripts/themes/blue-theme.sh
            ;;

        *) echo -e "\e[31m$op is not valid!\e[0m"
            ;;
    esac    

    [[ $op -gt 2 || $op -lt 1 ]] || break
done