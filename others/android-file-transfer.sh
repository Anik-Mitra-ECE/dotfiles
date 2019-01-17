### install android-file-transfer from source

sudo apt-get install build-essential cmake ninja-build libqt4-dev libfuse-dev libreadline-dev
cd ~/Downloads
git clone https://github.com/whoozle/android-file-transfer-linux.git
mkdir build && cd build
cmake ..
make
sudo make install
