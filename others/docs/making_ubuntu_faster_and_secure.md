# 1.  Disabling swap in Ubuntu

Having swap enables in SSD drive is quite harmful as it intensively writes on the SSD,  
making the SSD wear out quickly.

### To turn off the swapfile. Run the following command:

```sh
    $sudo swapoff /swapfile
```
### Now disable the swap file in /etc/fstab

```sh
    $sudo vim /etc/fstab
```
_put a '#' in front of '/swapfile'_


### delete swapfile
```sh
    $sudo rm -f /swapfile
```

### Now Restart and check
```sh
$free
```

# 2. Grub: disable disk queues for the SSD
[Explained Here](https://lonesysadmin.net/2013/12/06/use-elevator-noop-for-linux-virtual-machines/)

```sh
$sudo gedit /etc/default/grub

look for GRUB_CMDLINE_LINUX=””, change it to:
GRUB_CMDLINE_LINUX=”elevator=noop”
```
### faster bootup

```sh
$sudo gedit /etc/default/grub

look for GRUB_CMDLINE_LINUX_default="quiet splash" and change it to
GRUB_CMDLINE_LINUX_default="" 
```

# 3. editing /etc/fstab
### Applied some low writing to disk parameters for /
 
Changed from the original:

    UUID=XXXXXX / ext4 errors=remount-ro 0 1

to

    UUID=XXXXXX / ext4 noatime,nodelalloc,barrier=0,i_version,commit=30,inode_readahead_blks=64,errors=remount-ro 0 1

### Configured tmpfs filesystem for /tmp and /var/tmp

```sh
    tmpfs /tmp tmpfs noatime,nodiratime,nodev,nosuid,mode=1777,size=1G,defaults 0 0  
    tmpfs /var/tmp tmpfs noatime,nodiratime,nodev,nosuid,mode=1777,size=1G,defaults 0 0
```


About “size=1G”, if you don’t limit the tmpfs filesystems with this parameter it will “use” half of the available ram, but, will not “reserve it”, you can still use it, but the tmpfs filesystem COULD get to use half the ram if something goes south. So I just limited it both mount points, and checked more or less regularly against my current use pattern (df -h in a CLI), and 1GB worked well.


# 4. Disable Suspend
System | Preferences | Power Management 
Select "Dont suspend"

Open up Terminal once again and type

```sh
    $sudo nvim /var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla
```


Scroll to the bottom. Check to see if the following information exists, and if not add them:

```sh
    [Disable suspend]
    Identity=unix-user:*
    Action=org.freedesktop.upower.suspend
    ResultActive=no
```

read more : [Ubuntu Doc](https://help.ubuntu.com/community/Fstab)


# 5. Meltdown and spectre
You can install the intel microcode updates to avoid spectre and meltdown for intel processors.

```sh
sudo apt install microcode.ctl intel-microcode
sudo poweroff --reboot
dmesg | grep "updated"
```
