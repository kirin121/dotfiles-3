#!/usr/bin/env bash

fg="$(xres color15)"
light="$(xres color8)"

while getopts idq options
do
	case $options in
		i)
			pamixer -i 2
			;;

		d)
			pamixer -d 2
			;;
		q)
            cur_vol=$(pamixer --get-volume-human)
			echo -ne "%{F$light}vol %{F$fg}$cur_vol"
			;;
	esac
done
