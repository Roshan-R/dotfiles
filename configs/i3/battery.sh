#!/bin/zsh

power_file="/sys/class/power_supply/BAT1/capacity"
status_file="/sys/class/power_supply/BAT1/status"

power_status=$(cat "$status_file")
power=$(cat "$power_file")

if [[ $power_status == "Charging" ]];then
		glyph=

elif (( $power >= 0 && $power <= 15));then
		glyph=  

elif (( $power >= 16 && $power <= 30));then
		glyph= 

elif (( $power >= 31 && $power <=60 ));then
		glyph= 
		
elif (( $power >= 61 && $power <= 80 ));then
		glyph=


elif (( $power >= 81 && $power <= 100 ));then
		glyph= 
fi

echo $power $glyph
