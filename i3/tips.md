## Alternative bindings for the 540p using pactl and i3 - Keyboard

 ### set laptop display to lower res - thats better
   `exec  xrandr --output eDP1 --mode 1920x1080 `
 
 ### set Numlock to on at login time
   `exec --no-startup-id numlockx on`
 

 ### volume ctl
   `bindsym Control+KP_8 exec --no-startup-id pactl set-sink-volume 1 +5% `
   `bindsym Control+KP_2 exec --no-startup-id pactl set-sink-volume 1 -5% `
 
### Sreen brightness controls
   `bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness`
   `bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness`

### Touchpad controls
   `bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad`


# WIFI 
  https://askubuntu.com/questions/461825/how-to-connect-to-wifi-from-the-command-line
  https://superuser.com/questions/57516/how-do-i-make-nm-applet-the-default-network-manager-instead-of-knetworkmanager-in

### To see list of saved connections, use (<SavedWiFiConn>)

# nmcli c
## To see list of available WiFi hotspots (<WiFiSSID>)
   `nmcli d wifi list`
   or:
   `sudo iwlist wlan0 scanning`

## To see list of interfaces (<WifiInterface>)
   `ifconfig -a`

## If your wi-fi access point is saved, it will auto-connect. 
## Turn wireless on or off with a simpler command:
```bash
nmcli nm wifi on
nmcli nm wifi off
#on newer version:
nmcli radio wifi on
nmcli radio wifi off
```

## using AltGr key

https://www.reddit.com/r/i3wm/comments/709amk/how_to_set_mod_to_altgr/

## Screen lock from Suspend

i3 provides `i3lock` to lock the display.
You can conveniently bind it to a key combination in the `config` file.
For example: `bindsym $mod+l exec --no-startup-id i3lock`, which binds it to the `Win+L` combination.
You might also want to lock the screen on resume from suspend.
This can be achieved, assuming your system is plagued with the popular `systemd` malware, by placing the following file in `/etc/systemd/system/wakelock.service`:

    [Unit]
    Description=Runs i3lock on system resume from a suspended state
    Before=systemd-suspend.service

    [Service]
    User=alberto
    Type=forking
    Environment=DISPLAY=:0
    ExecStart=/usr/bin/i3lock

    [Install]
    WantedBy=sleep.target
    WantedBy=suspend.target

Just remember to enable it with `sudo systemctl enable wakelock`.

# Supercool
https://www.reddit.com/r/unixporn/comments/8monwi/i3gapspolybar_my_first_attempt_at_ricing/
https://github.com/prmsrswt/dotfiles
https://github.com/addy-dclxvi/i3-starterpack

