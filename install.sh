#!/bin/bash

# This is my post installation script for arch linux
# This script is written for my device and may not work for you

echo "Hi! This is post installation script for Luka281."
echo "Script currently works on arch linux only!"

echo " "

down_arr=() # array for pacman installs
down_arr_yay=() # array for aur installs

function Wifi {
    echo -n "::Do you want wifi and other drivers set up on your system? [y/n]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Neccecery programs will be installed!"
    	    down_arr[${#down_arr[@]}]='wireless_tools'
    	    down_arr[${#down_arr[@]}]='network-manager-applet'
            down_arr[${#down_arr[@]}]='broadcom-wl-dkms'
    	    down_arr[${#down_arr[@]}]='linux-headers'
            down_arr[${#down_arr[@]}]='wpa_supplicant'

            down_arr[${#down_arr[@]}]='xf86-video-intel'
    	    down_arr[${#down_arr[@]}]='intel-ucode'
            down_arr[${#down_arr[@]}]='broadcom-wl-dkms'
    	    down_arr[${#down_arr[@]}]='linux-headers'
            down_arr[${#down_arr[@]}]='wpa_supplicant'

    else 
	    echo "Wifi set up cancelled!"
    fi;
}

function Awesomewm {
    echo -n "::Do you want to install custom awesomewm? [y/n]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Neccecery programs will be added"
            down_arr[${#down_arr[@]}]="awesome"
            down_arr[${#down_arr[@]}]="brightnessctl"
            down_arr[${#down_arr[@]}]="light"
            down_arr[${#down_arr[@]}]="acpi"
            down_arr[${#down_arr[@]}]="lxappearance"
            down_arr[${#down_arr[@]}]="shotgun"
	    #configs
	    git clone https://github.com/Luka281/awesome.git;
	    mv awesome ~/.config/
	    git clone https://github.com/Luka281/dmenu.git
	    mv dmenu ~/.config/
	    cd ~/.config/dmenu/
	    sudo make install
    else
	    echo "Awesomewm downdoad cancelled!"
    fi;

}	    


function Yay {
    echo -n "::Installing yay is neccecery to continue [y/n]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Necceccery programs will be installed!"
            git clone https://aur.archlinux.org/yay.git;
            cd yay;
            makepkg -si
    else
        echo "Yay download cancelled!"
    fi;
}


function Apps {
    echo -n "::Do you want to install your apps? [y/n]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Necceccery programs will be installed"
            down_arr_yay[${#down_arr[@]}]="librewolf-bin"
            down_arr[${#down_arr[@]}]="vim"
            down_arr[${#down_arr[@]}]="vlc"
            down_arr[${#down_arr[@]}]="unzip"
            down_arr[${#down_arr[@]}]="unrar"
            down_arr_yay[${#down_arr[@]}]="tutanota-desktop-bin"
            down_arr[${#down_arr[@]}]="qbittorrent"
            down_arr_yay[${#down_arr[@]}]="vscodium-bin"
            down_arr[${#down_arr[@]}]="neofetch"
            down_arr[${#down_arr[@]}]="nemo"
            down_arr[${#down_arr[@]}]="kitty"
            down_arr[${#down_arr[@]}]="codeblocks"
            down_arr[${#down_arr[@]}]="xreader"
            down_arr[${#down_arr[@]}]="pqiv"
            down_arr[${#down_arr[@]}]="gparted"
            down_arr_yay[${#down_arr[@]}]="balena-etcher-bin"
            down_arr[${#down_arr[@]}]="alsa-utils"
            down_arr[${#down_arr[@]}]="htop"
            down_arr[${#down_arr[@]}]="sddm"
    fi;
}



function Fonts {
    echo -n "::Do you want to install your fonts? [y/n]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Necceccery programs will be installed"
            down_arr_yay[${#down_arr_yay[@]}]="spleen-font"
            down_arr[${#down_arr[@]}]="cantarell-fonts"
            down_arr[${#down_arr[@]}]="adobe-source-code-pro-fonts"
            down_arr[${#down_arr[@]}]="gnu-free-fonts"
            down_arr[${#down_arr[@]}]="xorg-fonts-100dpi"
            down_arr[${#down_arr[@]}]="xorg-fonts-75dpi"
            down_arr[${#down_arr[@]}]="xorg-fonts-alias-100dpi"
            down_arr[${#down_arr[@]}]="xorg-fonts-alias-75dpi"
            down_arr[${#down_arr[@]}]="ttf-linux-libertine"
            down_arr_yay[${#down_arr[@]}]="nerd-fonts-droid-sans-mono"
            down_arr_yay[${#down_arr_yay[@]}]="tfonts-droid-fallback"
            down_arr_yay[${#down_arr_yay[@]}]="ttf-borg-sans-mono"

    fi;
}



function Themes {
    echo -n "::Do you want to install your sddm and system themes and icons? [y/n]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Necceccery programs will be installed"
            down_arr_yay[${#down_arr_yay[@]}]="archlinux-themes-sddm"
            down_arr[${#down_arr[@]}]="deepin-gtk-theme"
            down_arr_yay[${#down_arr_yay[@]}]="multicolor-sddm-theme"
            down_arr_yay[${#down_arr_yay[@]}]="nordic-polar-theme"
            down_arr[${#down_arr[@]}]="oxygen-icons"
            down_arr[${#down_arr[@]}]="pop-gtk-theme"
            down_arr[${#down_arr[@]}]="pop-gtk-theme"
            down_arr_yay[${#down_arr[@]}]="sddm-theme-astronaut"
            down_arr_yay[${#down_arr_yay[@]}]="xcursor-oxygen"
            down_arr_yay[${#down_arr_yay[@]}]="qogir-icon-theme"
            down_arr_yay[${#down_arr_yay[@]}]="qogir-gtk-theme"
            down_arr_yay[${#down_arr_yay[@]}]="fluent-cursor-theme-git"
            down_arr_yay[${#down_arr_yay[@]}]="nordic-standard-buttons-theme"
            down_arr_yay[${#down_arr_yay[@]}]="nordic-theme"
            down_arr_yay[${#down_arr_yay[@]}]="fluent-cursor-theme-git"
            down_arr_yay[${#down_arr_yay[@]}]="adwaita-dark"
            down_arr_yay[${#down_arr_yay[@]}]="nordic-theme"
            down_arr_yay[${#down_arr_yay[@]}]="tela-icon-theme-bin"

            sleep 1

            tar zxvf dots.tar.gz

            sleep 0.5

            cd dots
            mv .icons ~/
            mv .themes ~/

            sleep 0.5

            tar zxvf sddmthemes.tar.gz
            sudo mv sddmthemes /usr/share/sddm/

    fi;
}

sleep 1

Yay

sleep 1

echo " "

Fonts

sleep 1

echo " "

Wifi   

sleep 1

echo " "

Awesomewm

sleep 1

echo " "

Apps

sleep 1

echo " "

Themes

sleep 1

echo " "

sudo pacman -S ${down_arr[@]}     

sleep 1

echo " "

yay -S ${down_arr_yay[@]} 

sleep 1

           
# modprobe
sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma;
sudo modprobe wl;