# Mount Drive From CLI and Startup


## Mounting the Drive
You need to use the mount command.
Open terminal and tapy the following command for creating mound point.

$ sudo mkdir /media/2ndHD

##### To mount the drive, enter:  
```sh
$ sudo mount /dev/sda2 /media/2ndHD
$ df -H
```
##### To view files cd to /media/2ndHD, enter:  
```sh
$ cd /media/2ndHD
$ ls -l
```
- - -

## Automatic Mount At Boot Time

##### create backup of fstab first
```sh
sudo cp /etc/fstab /etc/fstab.bak
```
Then add a new partition by editing this file as root:

##### You need to edit /etc/fstab file, enter:
```sh
$ sudo vim /etc/fstab
```

##### get UUID
```sh
sudo blkid
UUID=pastenumbercopiedfromabove   /media/2ndHD    ext4    defaults    0    2
```

##### Add the following line for ext4 file system:
```sh
/dev/sda2    /media/2ndHD   ext4    defaults     0        2
```

##### Add the following line for Windows FAT32 file system:
```sh
/dev/sda2    /media/2ndHD   vfat    defaults     0        2
```

#### Test settings
To see if the drive is mounted correctly we can simulate the mount process at boot with
```sh
sudo mount -a
```
