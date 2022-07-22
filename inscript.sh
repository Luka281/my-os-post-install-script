#!/bin/bash

# This is my post installation script for arch linux

echo "Hi! This is post installation script for Luka281."
echo "Script currently works on arch linux only!"

echo " "

down_arr=() #In this array will be put thing to download

function Wifi {
    echo -n "Do you want wifi and other drivers set up on your system? [yn]: ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Neccecery wifi progrrams will be added"
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
	    echo "Wifi set up cancelled"
    fi;
}

function Awesomewm {
    echo -n "Do you want custom awesomewm installed? [yn]:  ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Neccecery programms will be added"
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
	    echo "Awesomewm downdoad cancelled"
    fi;

}	    


function Yay {
    echo -n "Installing yay is neccecery to continue [yn]:  ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Necceccery proggrams will be installed"
            sudo pacman -S git;
            git clone https://aur.archlinux.org/yay.git;
            cd yay;
            makepkg -si
    else
        echo "Install stopped!"
        exit 0;
    fi;
}


function Apps {
    echo -n "Do you want to install your apps? [yn]:  ";
    read;
    if [ ${REPLY} = "y" ]; then
	    echo "Necceccery proggrams will be installed"
            down_arr[${#down_arr[@]}]="librewolf-bin"
            down_arr[${#down_arr[@]}]="vim"
            down_arr[${#down_arr[@]}]="vlc"
            down_arr[${#down_arr[@]}]="unzip"
            down_arr[${#down_arr[@]}]="unrar"
            down_arr[${#down_arr[@]}]="tutanota-desktop-bin"
            down_arr[${#down_arr[@]}]="qbittorrent"
            down_arr[${#down_arr[@]}]="vscodium-bin"
            down_arr[${#down_arr[@]}]="neofetch"
            down_arr[${#down_arr[@]}]="nemo"
            down_arr[${#down_arr[@]}]="kitty"
            down_arr[${#down_arr[@]}]="codeblocks"
            down_arr[${#down_arr[@]}]="xreader"
            down_arr[${#down_arr[@]}]="pqiv"
            down_arr[${#down_arr[@]}]="gparted"
            down_arr[${#down_arr[@]}]="balena-etcher"
            down_arr[${#down_arr[@]}]="alsa-utils"
    fi;
}

Wifi   

Awesomewm

Yay

Apps

yay -Syu ${down_arr[@]}                
                       
# modprobe
sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma;
sudo modprobe wl;
