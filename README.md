# i3switch
Enables you to switch between open windows in [i3wm](https://wiki.archlinux.org/index.php/I3).

## Requires [dmenu](https://wiki.archlinux.org/index.php/Dmenu) to be already installed.

## Usage Example
add following line to your i3 config and restart it.
```
bindsym $mod+Tab exec <path-to-script-file>/switch-window.sh
```
Now when you press `$mod+Tab` then you will get a dmenu propmp to select the window to switch to from all the open windows.

Selecting any item would switch you to that window.

#### Note :
If you have [wmctrl](http://tripie.sweb.cz/utils/wmctrl/) then the last line in script, that is commented out right now, is enough for the functionality. At that point you may just write that directly in the i3 config. Additionaly if you have other window managers that support wmctrl, then that would work there as well.

