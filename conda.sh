#!/bin/bash

# Navigate to root directory
cd /root

## Download and install Anaconda
printf "Downloading Anaconda......"
wget -q http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-Linux-x86_64.sh
printf "Installing Anaconda....."
bash -q Anaconda-2.1.0-Linux-x86_64.sh -b
rm -rf Anaconda.sh

## Create ipython profile
printf "Setting iPython settings...."
ipython profile create default
echo "c.NotebookApp.ip = '*'" >> /root/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /root/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.port = 8888" >> /root/.ipython/profile_default/ipython_notebook_config.py

echo "import os\nos.environ['SPARK_HOME'] = '/root/spark'" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
echo "import sys\nsys.path.insert(0, '/root/spark/python')" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
echo "CLUSTER_URL = open('/root/spark-ec2/cluster-url').read().strip() >> /root/.ipython/profile_default/startup/00-pyspark-setup.py-



printf "Your Spark cluster is ready!\n\nTo use an iPython notebook, you should:\n\n"
printf "1. Run: ./spark-ec2 -k <keypair> -i <key-file> login <cluster-name> \n"
printf "2. Type: ipython notebook \n" 
printf "3. In your browser, go to http://%s/8880\n" "$PUBLIC_DNS"
    
