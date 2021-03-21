#!/bin/bash
# Get IDs for all the open windows
# ids=$($HOME/.scripts/get-window-id.sh a)
ids=$(xprop -root |grep _NET_CLIENT_LIST_STACKING\(WINDOW\) |cut -d"#" -f2| tr -d " "|tr "," " ")

for id in $ids
# get Class Name for all the windows
# do names="$names $($HOME/.scripts/get-window-name.sh $id)"
do names="$names $(xprop -id $id| grep WM_CLASS |tr -d '" '|cut -d "=" -f2|awk -F "," '{print $NF}')($id)"
done

# Show Open window class names as a dmenu option
target=$(echo $names | tr " " "\n" | dmenu -p "Choose a window to switch to: " -l 10 | grep -Eo "\(.*\)" | tr -d "()" )

# switch to chosen window
i3-msg [id="$target"] focus


# If you install wmctrl then just following command is sufficient:
# wmctrl -i -a $(wmctrl -l | dmenu -p "Choose a window to switch to: " -l 10 | cut -d " " -f1)
# same if you have rofi
# wmctrl -i -a $(wmctrl -l -x -u | cut -d" " -f "1 4-" | rofi -dmenu -i -p "window" | cut -d " " -f1)
