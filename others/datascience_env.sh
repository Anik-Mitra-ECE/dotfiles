#!/bin/bash

echo "#############################################"
echo "############# Setup SSH #####################"
echo "#############################################"

sudo apt-get install -y openssh-server

# setup easy login to localhost
ssh-keygen -t rsa -b 4096
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys


echo "#############################################"
echo "############ Setup Anaconda #################"
echo "#############################################"
wget 'http://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh'
bash Anaconda3*sh -b
echo 'export PATH=${HOME}/anaconda3/bin:$PATH' >> ~/.bashrc
conda install -c conda-forge fastparquet geopandas fiona snappy python-snappy\
    bokeh dask distributed numba scikit-learn pyarrow matplotlib palettable\
    seaborn bottleneck

pip3 install git+https://github.com/pymc-devs/pymc3
pip3 install brewer2mpl


echo "#############################################"
echo "############ Setup Spark ####################"
echo "#############################################"
conda install -c quasiben spark=2.0.2 -y
#HADOOP VARIABLES START
JAVA_HOME=`which java`
JAVA_HOME=`readlink -f ${JAVA_HOME}`
export JAVA_HOME=`echo ${JAVA_HOME} | sed -e 's/\/bin\/java//'`

export JRE_HOME=${JAVA_HOME}
export PYSPARK_SUBMIT_ARGS="--master 'local[4]' --executor-memory 3G --driver-memory 3G"
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser "
export SPARK_DRIVER_PYTHON=${HOME}/anaconda3/bin/python



echo "#############################################"
echo "############ Setup R ########################"
echo "#############################################"

conda install -c r r 
conda install -c r rpy2 r-tidyverse r-shiny r-essentials r-sparklyr \
    r-feather r-markdown r-knitr r-spatial r-rstan r-rbokeh r-maps \
    r-hexbin r-ggvis
	
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
sudo gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
sudo gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update

sudo apt-get install gdebi-core
wget https://download1.rstudio.org/rstudio-1.0.143-amd64.deb
sudo gdebi -n rstudio-1.0.143-amd64.deb
rm rstudio-1.0.143-amd64.deb


echo "#############################################"
echo "############ Setup Docker ###################"
echo "#############################################"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' | sudo tee -a /etc/apt/sources.list.d/docker.list
sudo apt-get update && sudo apt-get install -y docker-engine




echo "#############################################"
echo "######## Setup Python libs ##################"
echo "#############################################"

pip3 install numpy
pip3 install scipy
pip3 install scikit-learn
pip3 install pandas
pip3 install patsy
pip3 install statsmodels
pip3 install networkx
pip3 install gensim
pip3 install scrapy
pip3 install numexpr bottleneck
pip3 install sqlalchemy
pip3 install nltk
pip3 install seaborn
sudo apt-get install python3-tk
pip3 install matplotlib
