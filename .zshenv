which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'

set_volume() {
    pactl -- set-sink-volume 0 $1%
}
