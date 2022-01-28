#!/bin/dash

interval=0

black=#1E1D2D
green=#ABE9B3
white=#D9E0EE
grey=#282737
blue=#96CDFB
red=#F28FAD
darkblue=#83bae8

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$black^ ^b$green^ CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
	updates=$(aptitude search '~U' | wc -l)

	if [ -z "$updates" ]; then
		printf "^c$green^ "
	else
		printf "^c$green^  $updates"""
	fi
}

battery() {
	printf "^c$blue^   $(cat /sys/class/power_supply/BAT0/capacity)%%"

    battery=$(cat /sys/class/power_supply/BAT0/capacity)
}

mem() {
	printf "^c$blue^^b$black^  "
	printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
        up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^$(iwgetid -r)" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%R') "
}

while true; do

	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
	interval=$((interval + 1))

	sleep 1 && xsetroot -name "$updates $(battery) $(cpu) $(mem) $(wlan) $(clock)"
done
