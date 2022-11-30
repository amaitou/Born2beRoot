#!/usr/bin/bash

wall "
	#Architecture	: $(uname -a)
	#CPU physical	: $(cat /proc/cpuinfo | grep processor | wc -l)
	#vCPU		: $(cat /proc/cpuinfo | grep processor | wc -l)
	#Memory Usage	: $(free --mega | grep Mem | awk '{printf "%d/%dMB (%.2f%%)", $3, $2, $3*100/$2}')
	#Disk Usage	: $(df -Bg --total | grep total |awk '{printf "%d/%dGB (%d%%)", $3 * 1024, $4, $5}')
	#CPU load	: $(mpstat | grep all | cut -c 20- | awk '{printf "%.2f%%", 100 - $10}')
	#Last boot	: $(who -b | awk '{printf "%s %s", $3, $4}')
$(if cat /etc/fstab | grep -q mapper; then
	echo "	#LVM use	: yes"
else
	echo "	#LVM use	: no"
fi)
	#Connections TCP: $(ss --tcp | wc -l | awk '{printf "%d ESTABLISHED", $1 - 1}')
	#User log	: $(users | wc -w)
	#Network	: IP $(hostname -I)$(ifconfig | ip link | grep ether | awk '{printf "(%s)", $2}')
	#Sudo		: $(ls /var/log/sudo/00/00/ | wc -w) cmd"
