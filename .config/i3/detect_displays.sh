#! /bin/bash

home1=HDMI-1
work1=DVI-I-1-1
work2=DVI-I-2-2

# Undetect all displays
xrandr --output $home1 --off
xrandr --output $work1 --off
xrandr --output $work2 --off

if xrandr | grep "HDMI-1 connected"; then
	echo "enabling HDMI-1, assuming home station"
	xrandr --output HDMI-1 --auto --right-of eDP-1
	echo "Running autorandr with home config"
	autorandr --change home
	echo "Xft.dpi: 120" | xrdb -merge
	echo "DPI changed to 120, restart some applications to see changes"
elif xrandr | grep "DVI-I-1-1"; then
	echo "enabling DVI-I-1-1 & DVI-I-2-2, assuming work station"
	xrandr --output $work1 --auto --right-of eDP-1
	xrandr --output $work2 --auto --right-of $work1
	echo "Xft.dpi: 120" | xrdb -merge
	echo "DPI changed to 120, restart some applications to see changes"
else
	echo "No displays detected, running in laptop mode"
	autorandr --change laptop
	echo "Xft.dpi: 120" | xrdb -merge
	echo "DPI changed to 120, restart some applications to see changes"
fi
