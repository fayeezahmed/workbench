#! /bin/bash
#
laptop=eDP-1
home1=HDMI-1
work1=DVI-I-1-1
work2=DVI-I-2-2
reset_flag=0

function reset_displays() {
	# Undetect all displays
	echo "resetting displays"
	xrandr --output $home1 --off
	xrandr --output $work1 --off
	xrandr --output $work2 --off
	xrandr --output $laptop --scale 1x1
}

function setup_display() {
	display_name=$1
	case "${display_name}" in
	home1)
		if xrandr | grep "HDMI-1 connected"; then
			echo "Setting up home1 display $home1"
			xrandr --output HDMI-1 --auto --right-of eDP-1
		fi
		;;
	work)
		if xrandr | grep "DVI-I-1-1" &&
			xrandr | grep "DVI-I-2-2"; then

			echo "Setting up work display $work1 & $work2"
			xrandr --output $work1 --auto --right-of $laptop
			xrandr --output $work2 --auto --right-of $work1
		fi
		;;
	esac
}

function set_autorandr_display() {
	display_name=$1
	case "${display_name}" in
	home1)
		autorandr --change home
		;;
	work)
		autorandr --change work
		;;
	esac
}

usage() {
	echo "Usage: $0 [-r][-i home1|home2|work][-s home1|home2|work]" 1>&2
	exit 1
}

while getopts ri:s: flag; do
	case "${flag}" in
	r) reset_flag=1 ;;
	i) initial_setup=${OPTARG} ;;
	s) use_autorandr=${OPTARG} ;;
	*)
		usage
		;;
	esac
done
shift $(($OPTIND - 1))

if [ $reset_flag ]; then
	reset_displays
fi

if [ "$initial_setup" ]; then
	echo "initial setup flag is ${initial_setup}"
	setup_display "$initial_setup"
fi

if [ "$use_autorandr" ]; then
	echo "autorandr  flag is ${use_autorandr}"
	set_autorandr_display "$use_autorandr"
fi
