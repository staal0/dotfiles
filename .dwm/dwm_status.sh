#!/bin/bash

# PIPEWIRE
#print_volume() {
#        status="$(pw-volume status | jq -r '.tooltip')"
#        if test "$status" == "muted"
#        then
#        	echo -e "${status} vol"
#        else
#                volume="$(pw-volume status | jq -r '.percentage')"
#        	echo -e "${volume}% vol"
#        fi
#}

print_volume() {
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	mute="$(amixer get Master | tail -n1 | cut -d ' ' -f 8- | sed -r 's/.*\[(.*)\].*/\1/')"

	if test $mute == "on"
	then 
		if test "$volume" -gt 0
		then
			echo -e "Vol: ${volume}%"
		else
			echo -e "Vol: Mute"
		fi
	else
		echo -e "Vol: Mute"
	fi
}

print_mem(){
	# memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	# echo -e "$memfree"
	mem="$(free | grep Mem | awk '{print $3/$2 * 100.0}')"
	printf "%.1f" $mem
	echo "% mem"
}

print_cpu(){
	cpu=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}')

	echo "$cpu cpu"
}

print_battery(){
	hash acpi || return 0
	onl="$(grep "on-line" <(acpi -V))"
	charge="$(awk '{ sum += $1 } END { print sum }' /sys/class/power_supply/CMB1/capacity)"
	if test -z "$onl"
	then
		# suspend when we close the lid
		#systemctl --user stop inhibit-lid-sleep-on-battery.service
		echo -e "${charge}% bat"
	else
		# On mains! no need to suspend
		#systemctl --user start inhibit-lid-sleep-on-battery.service
		echo -e "${charge}% psu"
	fi
}

print_date(){
	date "+%a (%V) %d-%m-%Y %X"
}

while true
do
	xsetroot -name "$(print_cpu) | $(print_mem) | $(print_volume) | $(print_date)"
	sleep 1
done

