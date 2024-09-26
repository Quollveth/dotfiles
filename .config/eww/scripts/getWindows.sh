#!/bin/bash

readarray -t APPS < <(
	wmctrl -l | 
	awk -v aws=$(wmctrl -d | awk '/\*/ {print $1}') '
	$2 == aws {
		id = $1;
		cmd = "xprop -id " id " WM_CLASS";
		cmd | getline class;
		close(cmd);
		split(class, a, "\"");
		print a[4];
	}'
)
ICONS=()
for app in "${APPS[@]}"; do
	icon=$(\
		find /usr/share/applications/ -name '*.desktop' | \
		grep -F "$app" | \
		xargs -I {} grep -i '^Icon=' {} | \
		cut -d'=' -f2 |\
		xargs -I {} find /usr/share/icons -name "{}*" 2>/dev/null | head -n 1
	)
	if [ -n "$icon" ]; then
		ICONS+=("$icon")
	fi
done
echo "["
for i in $(seq 0 $(( ${#ICONS[@]} - 1 ))); do
	echo "{"
	echo "\"name\":\"${APPS[i]}\","
	echo "\"icon\":\"${ICONS[i]}\""
	echo "}"
	if [ "$i" -lt "$(( ${#ICONS[@]} - 1 ))" ]; then
		echo ","
	fi
done
echo "]"
