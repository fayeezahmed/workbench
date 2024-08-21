#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

if [[$1 == 1]]; then
    echo ".... FC_DEBUG enabled ...."
fi

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

for m in $(polybar --list-monitors | cut -d":" -f1); do
    echo $m # eDP-1
    if [[ "$m" == "eDP-1" ]]; then
        continue;
    fi
    FC_DEBUG=$1 MONITOR=$m polybar --reload external --config=$HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
done

FC_DEBUG=$1 polybar --reload laptop --config=$HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown


echo "Bars launched..."
