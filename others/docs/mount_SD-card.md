# Mount SD card in ubuntu 18

### create mounting point
`sudo mkdir /mnt/SDcard`

### check the drive
`sudo fdisk -l`

### finally mount
`sudo mount -t vfat /dev/mmblk0p1 /mnt/SDcard`
