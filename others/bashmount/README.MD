Dependencies
============

 * bash
 * eject
 * Optional: udisks2

bashmount should work on all distributions with a recent version of lsblk.


Installation
============

1. As root, copy "bashmount" to "/usr/bin" or any other location in $PATH:

        install -m755 bashmount /usr/bin/bashmount

2. Backup any existing configuration files.

3. As root, copy "bashmount.conf" to "/etc/bashmount.conf" for global
   configuration:

        install -m644 bashmount.conf /etc/bashmount.conf

4. Optionally, copy "bashmount.conf" to "$HOME/.config/bashmount/config"
   for per-user configuration:

        mkdir -p $HOME/.config/bashmount/
        install -m644 bashmount.conf $HOME/.config/bashmount/config

5. Optionally, copy "bashmount.1" to "/usr/share/man/man1":

        gzip -9 bashmount.1
        install -m644 bashmount.1.gz /usr/share/man/man1/bashmount.1.gz

6. Make life a bit easier by setting an alias in "$HOME/.bashrc":

        alias bm='bashmount'



`author : https://github.com/jamielinux/bashmount`
