## Install Powerline
#### execute the following commands  

```sh
sudo apt install -y powerline
pip3 install git+git://github.com/Lokaltog/powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

#### now notice where powerline is located
```sh
pip3 show powerline-status
```

#### 
```sh
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
```

#### execute the following command(change the location received from -> pip3 show powerline-status)
```sh
. /home/xollad/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
```
