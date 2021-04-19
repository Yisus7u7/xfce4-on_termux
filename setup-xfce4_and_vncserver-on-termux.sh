#!/bin/bash

clear 

#this script will configure a graphical user interface 
#(xfce4) in termux
#creator: @Yisus7u7v
cd $HOME

echo -e '\e[1;36m installing packages, it is necessary  \e[1m'
echo -e '''
\e[1;31m Download speed depends on
 your internet connection \e[1m'''

sleep 3

clear

echo -e '\e[1;36m installing xfce4 and basic apps...\e[1m'

sleep 1

pkg update && pkg upgrade

pkg install -y x11-repo 

pkg install -y xfce4 xarchiver tigervnc geany gtk3 python-tkinter leafpad hexchat netsurf xfce4-terminal recordmydesktop feh mtpaint dosbox

clear

echo -e '\e[1;31mSetting up vnc server ...\e[1m'

sleep 3

mkdir $HOME/.vnc

echo """#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
""" > xstartup 

chmod +x xstartup

mv $HOME/xstartup $HOME/.vnc/xstartup

wget -L https://Yisus7u7.github.io/mirrors/scripts/user-dirs.dirs

chmod +x $HOME/user-dirs.dirs 

mv $HOME/user-dirs.dirs $HOME/.config/user-dirs.dirs 

mkdir $HOME/Desktop 

mkdir $HOME/Downloads 

mkdir $HOME/Templates 

mkdir $HOME/Public 

mkdir $HOME/Documents 

mkdir $HOME/Pictures 

mkdir $HOME/Videos 

termux-setup-storage

ln -s $HOME/storage/music Music 



echo -e """\e[1;32menjoy!!
To start the vnc server, use the command: vncserver to stop it, use the command: vncserver -kill: 1 Replace the: 1 with the port on which the vnc service is running\e[1m"""

exit


