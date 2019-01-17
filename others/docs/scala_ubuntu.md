# Java
sudo apt update
sudo apt install oracle-java8-installer
sudo apt install oracle-java8-set-default

# scala
sudo apt-get remove scala-library scala
sudo apt-get update
cd ~/Downloads
sudo wget www.scala-lang.org/files/archive/scala-2.12.6.deb
sudo dpkg -i scala-2.12.6.deb
sudo apt-get update

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt
