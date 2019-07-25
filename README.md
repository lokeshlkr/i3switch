# i3switch
Enables you to switch between open windows in i3wm

## Requires [dmenu](https://wiki.archlinux.org/index.php/Dmenu) to be already installed.

## Usage Example
add following line to your i3 config and restart it.
```
bindsym $mod+l exec $HOME/.scripts/switch-window.sh
```
Now when you press $mod+l then you will get a dmenu propmp to select the window to switch to from all the open windows.

Selecting any item would switch you to that window.
