#!/bin/bash

i3_path="/home/$USER/.config/i3/config"
path=$(pwd)
OS=$(cat /etc/*{release,version} | grep -w NAME | cut -d '"' -f 2)


if [ -f "$i3_path" ];then
    echo "Saving old i3 config file as config.old"
else
    cp $path/configs/config $i3_path
fi

things=( feh i3-blocks zsh )
toinstall=()

if [ $OS = "Ubuntu" ];then
    for thing in "${things[@]}";do
        if [[ $(dpkg -l | grep $thing) ]];then
            echo "$thing is installed "
        else
            toinstall=("${toinstall[@]}" $thing)
        fi
    done
    for thing in ${toinstall[@]};do
        echo $thing
    done
    
fi




