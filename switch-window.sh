#!/usr/bin/bash
# Get IDs for all the open windows
# ids=$($HOME/.scripts/get-window-id.sh a)
ids=$(xprop -root |grep _NET_CLIENT_LIST_STACKING\(WINDOW\) |cut -d"#" -f2| tr -d " "|tr "," " ")

for id in $ids
# get Class Name for all the windows
# do names="$names $($HOME/.scripts/get-window-name.sh $id)"
do names="$names $(xprop -id $id| grep WM_CLASS |tr -d '" '|cut -d "=" -f2|awk -F "," '{print $NF}')"
done

# Show Open window class names as a dmenu option
target=$(echo $names | tr " " "\n" | dmenu -p "Choose a window to switch to: " -l 10)

# switch to chosen window
i3-msg [class="$target"] focus
