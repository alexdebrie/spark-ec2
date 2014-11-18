#!/bin/bash

# Navigate to root directory
cd /root

## Download and install Anaconda
echo "Downloading Anaconda......"
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-Linux-x86_64.sh
echo "Installing Anaconda....."
bash Anaconda-2.1.0-Linux-x86_64.sh -b
rm -rf Anaconda.sh

## Create ipython profile
echo "Setting iPython settings...."
ipython profile create default
echo "c.NotebookApp.ip = '*'" >> /root/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /root/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.port = 8888"

echo "import os\nos.environ['SPARK_HOME'] = '/root/spark'" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
echo "import sys\nsys.path.insert(0, '/root/spark/python')" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
echo "CLUSTER_URL = open('/root/spark-ec2/cluster-url').read().strip() >> /root/.ipython/profile_default/startup/00-pyspark-setup.py-



echo "Your Spark cluster is ready!\n\nTo use an iPython notebook, you should:\n\n"
echo "1. Run: ./spark-ec2 -k <keypair> -i <key-file> login <cluster-name> \n"
echo "2. Type: ipython notebook \n" 
echo "3. In your browser, go to http://"
echo $PUBLIC_DNS
echo "/8880"
    
