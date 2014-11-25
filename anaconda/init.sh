#!/bin/bash

cd /root

echo  "Downloading Anaconda......"
wget -q http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-Linux-x86_64.sh
bash Anaconda-2.1.0-Linux-x86_64.sh -b
rm -rf Anaconda-2.1.0-Linux-x86_64.sh

echo "export PATH=/root/anaconda/bin:$PATH" >> /root/.bash_profile
source /root/.bash_profile
